import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yalp_core/yalp_core.dart';

import 'log_entry_entity.dart';

class IsarLogStorage implements ILogStorage {
  late Isar _db;

  @override
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();

    _db = await Isar.open(
      [LogEntryEntitySchema],
      directory: dir.path,
      name: 'logs.isar',
    );
  }

  @override
  Future<void> dispose() async {
    await _db.close();
  }

  @override
  Future<void> applyRetentionPolicy(RetentionPolicy policy) async {
    if (policy case KeepDaysPolicy(:final days)) {
      await _db.writeTxn(() async {
        final oldest = DateTime.now().subtract(Duration(days: days));

        await _db.logEntries.filter().timestampLessThan(oldest).deleteAll();
      });
    } else if (policy case KeepLastPolicy(:final count)) {
      await _db.writeTxn(() async {
        final total = await _db.logEntries.count();

        if (total > count) {
          final toDelete = total - count;

          await _db.logEntries
              .where()
              .sortByTimestamp()
              .limit(toDelete)
              .deleteAll();
        }
      });
    }
  }

  @override
  Future<List<String>> getTags() => _db.logEntries
      .where()
      .filter()
      .tagIsNotNull()
      .distinctByTag()
      .tagProperty()
      .findAll()
      .then((tags) => tags.cast<String>());

  @override
  Future<List<LogLevel>> getLevels() =>
      _db.logEntries.where().distinctByLevel().levelProperty().findAll();

  @override
  Future<List<String>> getClassnames() => _db.logEntries
      .where()
      .distinctByClassName()
      .classNameProperty()
      .findAll();

  @override
  Future<List<LogEntry>> getAllLogs() async {
    final entities = await _db.logEntries
        .where()
        .sortByTimestampDesc()
        .findAll();

    return entities.map(_fromEntity).toList();
  }

  @override
  Future<List<LogEntry>> getLogsFiltered(LogFilterOptions options) async {
    final entities = await _db.logEntries
        .where()
        .filter()
        .optional(
          options.tags.isNotEmpty,
          (q) => q.group((q) {
            var query = q.tagEqualTo(options.tags.first);

            for (final tag in options.tags.skip(1)) {
              query = query.or().tagEqualTo(tag);
            }

            return query;
          }),
        )
        .and()
        .optional(
          options.level.isNotEmpty,
          (q) => q.group((q) {
            var query = q.levelEqualTo(options.level.first);

            for (final level in options.level.skip(1)) {
              query = query.or().levelEqualTo(level);
            }

            return query;
          }),
        )
        .and()
        .optional(
          options.classnames.isNotEmpty,
          (q) => q.group((q) {
            var query = q.classNameEqualTo(options.classnames.first);

            for (final classname in options.classnames.skip(1)) {
              query = query.or().classNameEqualTo(classname);
            }

            return query;
          }),
        )
        .and()
        .optional(
          options.start != null,
          (q) => q.timestampGreaterThan(options.start!),
        )
        .and()
        .optional(options.end != null, (q) => q.timestampLessThan(options.end!))
        .and()
        .optional(
          options.invocation != null,
          (q) => q.invocationEqualTo(options.invocation!),
        )
        .sortByTimestampDesc()
        .optional(options.offset != null, (q) => q.offset(options.offset!))
        .optional(options.limit != null, (q) => q.limit(options.limit!))
        .findAll();

    return entities.map(_fromEntity).toList();
  }

  @override
  Future<List<LogEntry>> getLogsForInvocation(String invocation) async {
    final entities = await _db.logEntries
        .where()
        .invocationEqualTo(invocation)
        .sortByTimestampDesc()
        .findAll();

    final result = entities.map(_fromEntity).toList();

    result.addAll(await _getNestedLogs(invocation));

    result.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    return result;
  }

  Future<List<LogEntry>> _getNestedLogs(String invocation) async {
    final result = <LogEntry>[];
    final handledNestedInvocations = <String>{};

    final entities = await _db.logEntries
        .filter()
        .parentInvocationEqualTo(invocation)
        .sortByTimestampDesc()
        .findAll();

    for (final entity in entities) {
      if (!handledNestedInvocations.contains(entity.invocation)) {
        result.addAll(await _getNestedLogs(entity.invocation!));
        handledNestedInvocations.add(entity.invocation!);
      }

      result.add(_fromEntity(entity));
    }

    return result;
  }

  @override
  Future<LogStatistics> getStatistics() async {
    var traceCount = 0;
    var debugCount = 0;
    var infoCount = 0;
    var warningCount = 0;
    var errorCount = 0;
    var fatalCount = 0;

    final logs = await _db.logEntries.where().levelProperty().findAll();

    for (final log in logs) {
      switch (log) {
        case LogLevel.trace:
          traceCount++;
          break;
        case LogLevel.debug:
          debugCount++;
          break;
        case LogLevel.info:
          infoCount++;
          break;
        case LogLevel.warning:
          warningCount++;
          break;
        case LogLevel.error:
          errorCount++;
          break;
        case LogLevel.fatal:
          fatalCount++;
          break;
      }
    }

    return LogStatistics(
      traceCount: traceCount,
      debugCount: debugCount,
      infoCount: infoCount,
      warningCount: warningCount,
      errorCount: errorCount,
      fatalCount: fatalCount,
    );
  }

  @override
  Future<void> writeLog(LogEntry logEntry) async {
    final entity = LogEntryEntity(
      message: logEntry.message,
      timestamp: logEntry.timestamp,
      level: logEntry.level,
      tag: logEntry.tag,
      className: logEntry.className,
      functionName: logEntry.functionName,
      invocation: logEntry.invocation,
      parentInvocation: logEntry.parentInvocation,
      stackTrace: logEntry.stackTrace?.toString(),
      error: logEntry.error?.toString(),
    );

    try {
      await _db.writeTxn(() async {
        await _db.logEntries.put(entity);
      });
    } catch (e) {
      print('Failed to write log: $e');
    }
  }

  @override
  Future<void> clearLogs() async {
    await _db.writeTxn(() async {
      await _db.logEntries.clear();
    });
  }

  static LogEntry _fromEntity(LogEntryEntity e) {
    return LogEntry(
      message: e.message,
      timestamp: e.timestamp,
      level: e.level,
      tag: e.tag,
      className: e.className,
      functionName: e.functionName,
      invocation: e.invocation,
      stackTrace: switch (e.stackTrace) {
        var s? => StackTrace.fromString(s),
        _ => null,
      },
      error: e.error,
    );
  }
}
