import 'package:isar/isar.dart';

import 'package:yalp_core/yalp_core.dart';

part 'log_entry_entity.g.dart';

@Collection(accessor: 'logEntries')
class LogEntryEntity {
  Id? id;

  final String message;
  final DateTime timestamp;

  @Index()
  @enumerated
  final LogLevel level;

  @Index()
  final String? tag;
  final String className;
  final String functionName;

  @Index()
  final String? invocation;
  final String? parentInvocation;

  final String? stackTrace;
  final String? error;

  LogEntryEntity({
    this.id,
    required this.message,
    required this.timestamp,
    required this.level,
    required this.tag,
    required this.className,
    required this.functionName,
    required this.invocation,
    required this.parentInvocation,
    required this.stackTrace,
    required this.error,
  });
}
