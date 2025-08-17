import 'package:stack_trace/stack_trace.dart';

@pragma('vm:prefer-inline')
(String, String) extractClassAndFunctionFromStacktrace(StackTrace stackTrace) {
  final trace = Trace.from(stackTrace);

  final frame = trace.frames.where((e) => e.package != 'yalp_core').firstOrNull;

  final memberParts = frame?.member?.split('.') ?? [];

  return switch (memberParts) {
    [] => ('', ''),
    [final element] => ('', element),
    [final topLevel, ..., '<fn>'] => (
      frame?.uri.pathSegments.lastOrNull ?? '',
      topLevel,
    ),
    [final first, ..., final last] => (first, last),
  };
}
