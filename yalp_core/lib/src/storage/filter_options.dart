import '../log_entry.dart';

class LogFilterOptions {
  final DateTime? start;
  final DateTime? end;
  final List<String> tags;
  final List<LogLevel> level;
  final List<String> classnames;
  final String? invocation;
  final int? offset;
  final int? limit;

  const LogFilterOptions({
    this.start,
    this.end,
    this.tags = const <String>[],
    this.level = const <LogLevel>[],
    this.classnames = const <String>[],
    this.invocation,
    this.offset,
    this.limit,
  });
}
