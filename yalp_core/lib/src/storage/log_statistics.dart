class LogStatistics {
  final int logCount;
  final int traceCount;
  final int debugCount;
  final int infoCount;
  final int warningCount;
  final int errorCount;
  final int fatalCount;

  const LogStatistics({
    required this.traceCount,
    required this.debugCount,
    required this.infoCount,
    required this.warningCount,
    required this.errorCount,
    required this.fatalCount,
  }) : logCount =
           traceCount +
           debugCount +
           infoCount +
           warningCount +
           errorCount +
           fatalCount;
}
