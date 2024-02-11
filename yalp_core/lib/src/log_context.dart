import 'package:uuid/uuid.dart';

import 'helper.dart';

class LogContext {
  final String className;
  final String functionName;
  final String? invocation;
  final String? parentInvocation;

  const LogContext._({
    required this.className,
    required this.functionName,
    this.invocation,
    this.parentInvocation,
  });

  factory LogContext({
    String? className,
    String? functionName,
  }) {
    final (cn, fn) = _getClassNameAndFunctionName(className, functionName);

    return LogContext._(
      className: cn,
      functionName: fn,
      invocation: null,
      parentInvocation: null,
    );
  }

  factory LogContext.tracked({
    String? className,
    String? functionName,
  }) {
    final (cn, fn) = _getClassNameAndFunctionName(className, functionName);

    return LogContext._(
      className: cn,
      functionName: fn,
      invocation: const Uuid().v4(),
      parentInvocation: null,
    );
  }

  static (String, String) _getClassNameAndFunctionName(
    String? className,
    String? functionName,
  ) {
    return switch ((className, functionName)) {
      (var cn?, var fn?) => (cn, fn),
      (var cn?, _) => (cn, ''),
      (_, var fn?) => ('', fn),
      _ => extractClassAndFunctionFromStacktrace(StackTrace.current),
    };
  }
}
