import '../log_entry.dart';

class LogFilterOptions {
  final DateTime? start;
  final DateTime? end;
  final String? tag;
  final LogLevel? level;

  const LogFilterOptions({
    this.start,
    this.end,
    this.tag,
    this.level,
  });
}
