import 'package:stack_trace/stack_trace.dart';

import 'helper.dart';
import 'log_context.dart';
import 'log_entry.dart';
import 'storage/log_storage_interface.dart';
import 'storage/retention_policy.dart';

class Logger extends _BaseLogger {
  static RootLogger get root => _BaseLogger.root;
}

class RootLogger extends _BaseLogger {
  late ILogStorage _logStorage;

  LogLevel minStorageLevel = LogLevel.trace;

  RootLogger._();

  ILogStorage get logStorage => _logStorage;

  Future<void> init(ILogStorage storage, RetentionPolicy policy) async {
    _logStorage = storage;

    await _logStorage.init();
    await _logStorage.applyRetentionPolicy(policy);
  }
}

sealed class _BaseLogger {
  static final RootLogger root = RootLogger._();

  void trace(
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
      LogLevel.trace,
      tag,
      context,
    );
  }

  void debug(
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
      LogLevel.debug,
      tag,
      context,
    );
  }

  void info(
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
      LogLevel.info,
      tag,
      context,
    );
  }

  void warning(
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
      stackTrace ?? Trace.current(1).vmTrace,
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
      stackTrace ?? Trace.current(1).vmTrace,
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
      stackTrace ?? Trace.current(1).vmTrace,
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
    if (level.index < root.minStorageLevel.index) {
      return;
    }

    final (className, functionName) = switch (context) {
      final ctx? => (ctx.className, ctx.functionName),
      _ => extractClassAndFunctionFromStacktrace(
          stackTrace ?? StackTrace.current,
        ),
    };

    final (invocation, parentInvocation) = switch (context) {
      TrackedLogContext ctx => (ctx.invocation, ctx.parentInvocation),
      _ => (null, null),
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
      invocation: invocation,
      parentInvocation: parentInvocation,
    );

    root._logStorage.writeLog(entry);
  }
}
