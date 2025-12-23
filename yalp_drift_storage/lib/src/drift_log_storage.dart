import 'package:yalp_core/yalp_core.dart';
import 'package:yalp_drift_storage/src/database.dart';

class DriftLogStorage implements ILogStorage {
  late final LogDatabase _db;
  bool? _initialized;

  @override
  Future<void> init() async {
    if (_initialized == true) return;

    _db = await LogDatabase.connectInBackground();
    _initialized = true;
  }

  @override
  Future<void> dispose() async {
    if (_initialized != true) return;

    await _db.close();
  }

  @override
  Future<void> applyRetentionPolicy(RetentionPolicy policy) async {
    if (policy case KeepDaysPolicy(:final days)) {
      final oldest = DateTime.now().subtract(Duration(days: days));

      await _db.logDao.deleteLogsOlderThan(oldest);
    } else if (policy case KeepLastPolicy(:final count)) {
      await _db.logDao.deleteOutsideLimit(count);
    }
  }

  // MARK: Read
  @override
  Future<List<String>> getTags() => _db.logDao.getTags();

  @override
  Future<List<LogLevel>> getLevels() => _db.logDao.getLevels();

  @override
  Future<List<String>> getClassnames() => _db.logDao.getClassnames();

  @override
  Future<List<LogEntry>> getAllLogs() async {
    final entries = await _db.logDao.getAllLogs();

    return entries.map(_fromEntity).toList();
  }

  @override
  Future<List<LogEntry>> getLogsFiltered(LogFilterOptions options) async {
    final entries = await _db.logDao.getLogsFiltered(options);

    return entries.map(_fromEntity).toList();
  }

  @override
  Future<List<LogEntry>> getLogsForInvocation(String invocation) async {
    final entries = await _db.logDao.getLogsForInvocation(invocation);

    final result = entries.map(_fromEntity).toList();

    result.addAll(await _getNestedLogs(invocation));

    result.sort((a, b) => b.timestamp.compareTo(a.timestamp));

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

    final levels = await _db.logDao.getAllLevels();

    for (final level in levels) {
      switch (level) {
        case .trace:
          traceCount++;
        case .debug:
          debugCount++;
        case .info:
          infoCount++;
        case .warning:
          warningCount++;
        case .error:
          errorCount++;
        case .fatal:
          fatalCount++;
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

  // MARK: Write
  @override
  Future<void> writeLog(LogEntry logEntry) async {
    await _db.logDao.insertLog(logEntry);
  }

  @override
  Future<void> clearLogs() async {
    await _db.logDao.clear();
  }

  // MARK: Private
  Future<List<LogEntry>> _getNestedLogs(String invocation) async {
    final result = <LogEntry>[];
    final handledNestedInvocations = <String>{};

    final entities = await _db.logDao.getLogsForParentInvocation(invocation);

    for (final entity in entities) {
      if (!handledNestedInvocations.contains(entity.invocation)) {
        result.addAll(await _getNestedLogs(entity.invocation!));
        handledNestedInvocations.add(entity.invocation!);
      }

      result.add(_fromEntity(entity));
    }

    return result;
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
        final s? => StackTrace.fromString(s),
        _ => null,
      },
      error: e.error,
    );
  }
}
