enum LogLevel { trace, debug, info, warning, error, fatal }

class LogEntry {
  final String message;
  final DateTime timestamp;
  final Object? error;
  final StackTrace? stackTrace;
  final LogLevel level;
  final String? tag;
  final String className;
  final String functionName;
  final String? invocation;
  final String? parentInvocation;

  const LogEntry({
    required this.message,
    required this.timestamp,
    required this.level,
    required this.className,
    required this.functionName,
    this.error,
    this.stackTrace,
    this.tag,
    this.invocation,
    this.parentInvocation,
  });

  @override
  String toString() {
    return 'LogEntry{'
        'message: $message, '
        'timestamp: $timestamp, '
        'error: $error, '
        'stackTrace: $stackTrace, '
        'level: $level, '
        'tag: $tag, '
        'className: $className, '
        'functionName: $functionName, '
        'invocation: $invocation, '
        'parentInvocation: $parentInvocation'
        '}';
  }
}
