import 'package:stack_trace/stack_trace.dart';

(String, String) extractClassAndFunctionFromStacktrace(StackTrace stackTrace) {
  final trace = Trace.from(stackTrace);

  final frame = trace.frames.where((e) => e.package != 'yalp_core').firstOrNull;

  final memberParts = frame?.member?.split('.') ?? [];

  return switch (memberParts) {
    [] => ('', ''),
    [var element] => ('', element),
    [var topLevel, ..., '<fn>'] => (
        frame?.uri.pathSegments.lastOrNull ?? '',
        topLevel
      ),
    [var first, ..., var last] => (first, last),
  };
}
