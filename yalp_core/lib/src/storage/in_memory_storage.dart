import '../log_entry.dart';
import 'filter_options.dart';
import 'log_storage_interface.dart';
import 'retention_policy.dart';

class InMemoryStorage implements ILogStorage {
  final List<LogEntry> _logs = [];

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {}

  @override
  Future<void> applyRetentionPolicy(RetentionPolicy policy) async {
    if (policy is KeepAllPolicy) {
      return;
    } else if (policy is KeepLastPolicy) {
      _logs.removeRange(0, _logs.length - policy.count);
    } else if (policy is KeepDaysPolicy) {
      final now = DateTime.now();
      final cutoff = now.subtract(Duration(days: policy.days));

      _logs.removeWhere((log) => log.timestamp.isBefore(cutoff));
    }
  }

  @override
  Future<void> clearLogs() async {
    _logs.clear();
  }

  @override
  Future<List<LogEntry>> getAllLogs() => Future.value(_logs);

  @override
  Future<List<LogEntry>> getLogsFiltered(LogFilterOptions options) async {
    final iter = _logs.where((log) {
      if (options.tags.isNotEmpty && !options.tags.contains(log.tag)) {
        return false;
      }

      if (options.level.isNotEmpty && !options.level.contains(log.level)) {
        return false;
      }

      if (options.start != null && log.timestamp.isBefore(options.start!)) {
        return false;
      }

      if (options.end != null && log.timestamp.isAfter(options.end!)) {
        return false;
      }

      return true;
    }).skip(options.offset ?? 0);

    return switch (options.limit) {
      var limit? => iter.take(limit).toList(),
      _ => iter.toList(),
    };
  }

  @override
  Future<List<String>> getTags() async => _logs
      .where(
        (log) => log.tag != null,
      )
      .map<String>((log) => log.tag!)
      .toSet()
      .toList();

  @override
  Future<List<LogLevel>> getLevels() async =>
      _logs.map<LogLevel>((log) => log.level).toSet().toList();

  @override
  Future<void> writeLog(LogEntry logEntry) async {
    _logs.add(logEntry);
  }
}
