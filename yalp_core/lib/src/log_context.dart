import 'package:uuid/uuid.dart';

import 'helper.dart';

class LogContext {
  final String className;
  final String functionName;

  const LogContext._({
    required this.className,
    required this.functionName,
  });

  factory LogContext({
    String? className,
    String? functionName,
  }) {
    final (cn, fn) = _getClassNameAndFunctionName(className, functionName);

    return LogContext._(
      className: cn,
      functionName: fn,
    );
  }

  factory LogContext.tracked({String? className, String? functionName}) =>
      TrackedLogContext(className: className, functionName: functionName);
}

class TrackedLogContext extends LogContext {
  final String invocation;
  final String? parentInvocation;

  const TrackedLogContext._({
    required super.className,
    required super.functionName,
    required this.invocation,
    this.parentInvocation,
  }) : super._();

  factory TrackedLogContext({
    String? className,
    String? functionName,
  }) {
    final (cn, fn) = _getClassNameAndFunctionName(className, functionName);

    return TrackedLogContext._(
      className: cn,
      functionName: fn,
      invocation: const Uuid().v4(),
      parentInvocation: null,
    );
  }

  TrackedLogContext nested({
    String? className,
    String? functionName,
  }) {
    final (cn, fn) = _getClassNameAndFunctionName(className, functionName);

    return TrackedLogContext._(
      className: cn,
      functionName: fn,
      invocation: const Uuid().v4(),
      parentInvocation: invocation,
    );
  }
}

@pragma('vm:prefer-inline')
(String, String) _getClassNameAndFunctionName(
  String? className,
  String? functionName,
) {
  return switch ((className, functionName)) {
    (final cn?, final fn?) => (cn, fn),
    (final cn?, _) => (cn, ''),
    (_, final fn?) => ('', fn),
    _ => extractClassAndFunctionFromStacktrace(StackTrace.current),
  };
}
