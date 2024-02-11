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
  Future<List<LogEntry>> getAllLogs() async {
    final entities =
        await _db.logEntries.where().sortByTimestampDesc().findAll();

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
          options.start != null,
          (q) => q.timestampGreaterThan(options.start!),
        )
        .and()
        .optional(
          options.end != null,
          (q) => q.timestampLessThan(options.end!),
        )
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
  Future<void> writeLog(LogEntry logEntry) async {
    final entity = LogEntryEntity(
      message: logEntry.message,
      timestamp: logEntry.timestamp,
      level: logEntry.level,
      tag: logEntry.tag,
      className: logEntry.className,
      functionName: logEntry.functionName,
      invocation: logEntry.invocation,
      stackTrace: logEntry.stackTrace?.toString(),
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
    );
  }
}
