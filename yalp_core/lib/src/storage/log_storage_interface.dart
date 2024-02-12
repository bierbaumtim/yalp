import '../log_entry.dart';
import 'filter_options.dart';
import 'retention_policy.dart';

abstract interface class ILogStorage {
  Future<void> init();
  Future<void> dispose();

  Future<void> writeLog(LogEntry logEntry);

  Future<List<String>> getTags();
  Future<List<LogLevel>> getLevels();
  Future<List<String>> getClassnames();
  Future<List<LogEntry>> getAllLogs();
  Future<List<LogEntry>> getLogsFiltered(LogFilterOptions options);

  Future<void> applyRetentionPolicy(RetentionPolicy policy);
  Future<void> clearLogs();
}
