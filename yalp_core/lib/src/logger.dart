import 'helper.dart';
import 'log_context.dart';
import 'log_entry.dart';
import 'storage/log_storage_interface.dart';
import 'storage/retention_policy.dart';

class Logger extends _BaseLogger {
  static RootLogger get root => _BaseLogger.root;
}

class RootLogger extends _BaseLogger {
  ILogStorage? _logStorage;

  RootLogger._();

  Future<void> init(ILogStorage storage, RetentionPolicy policy) async {
    _logStorage = storage;

    await _logStorage!.init();
    await _logStorage!.applyRetentionPolicy(policy);
  }
}

sealed class _BaseLogger {
  static final RootLogger root = RootLogger._();

  void trace(
    String message, {
    StackTrace? stacktrace,
    String? tag,
    LogContext? context,
  }) {
    _log(
      message,
      DateTime.now(),
      null,
      stacktrace,
      LogLevel.trace,
      tag,
      context,
    );
  }

  void debug(
    String message, {
    StackTrace? stacktrace,
    String? tag,
    LogContext? context,
  }) {
    _log(
      message,
      DateTime.now(),
      null,
      stacktrace,
      LogLevel.debug,
      tag,
      context,
    );
  }

  void info(
    String message, {
    StackTrace? stacktrace,
    String? tag,
    LogContext? context,
  }) {
    _log(
      message,
      DateTime.now(),
      null,
      stacktrace,
      LogLevel.info,
      tag,
      context,
    );
  }

  void warning(
    String message, {
    StackTrace? stacktrace,
    String? tag,
    LogContext? context,
  }) {
    _log(
      message,
      DateTime.now(),
      null,
      stacktrace,
      LogLevel.warning,
      tag,
      context,
    );
  }

  void error(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? tag,
    LogContext? context,
  }) {
    _log(
      message,
      DateTime.now(),
      error,
      stackTrace,
      LogLevel.error,
      tag,
      context,
    );
  }

  void fatal(
    String message, {
    Object? error,
    StackTrace? stackTrace,
    String? tag,
    LogContext? context,
  }) {
    _log(
      message,
      DateTime.now(),
      error,
      stackTrace,
      LogLevel.fatal,
      tag,
      context,
    );
  }

  @pragma('vm:prefer-inline')
  void _log(
    String message,
    DateTime timestamp,
    Object? error,
    StackTrace? stackTrace,
    LogLevel level,
    String? tag,
    LogContext? context,
  ) {
    final (className, functionName) = switch (context) {
      var ctx? => (ctx.className, ctx.functionName),
      _ => extractClassAndFunctionFromStacktrace(
          stackTrace ?? StackTrace.current,
        ),
    };

    final entry = LogEntry(
      message: message,
      timestamp: timestamp,
      error: error,
      stackTrace: stackTrace,
      level: level,
      tag: tag,
      className: className,
      functionName: functionName,
      invocation: context?.invocation,
    );

    root._logStorage?.writeLog(entry);
  }
}
