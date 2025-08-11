import 'package:drift/drift.dart';
import 'package:yalp_core/yalp_core.dart';
import 'package:yalp_drift_storage/src/database_mixin.dart';

part 'database.g.dart';

@TableIndex(name: 'log_entries_level', columns: {#level}, unique: false)
@TableIndex(name: 'log_entries_tag', columns: {#tag}, unique: false)
@TableIndex(
  name: 'log_entries_invocation',
  columns: {#invocation},
  unique: false,
)
class LogEntryEntities extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get message => text()();
  DateTimeColumn get timestamp => dateTime()();

  IntColumn get level => intEnum<LogLevel>()();
  TextColumn get tag => text().nullable()();
  TextColumn get className => text()();
  TextColumn get functionName => text()();
  TextColumn get invocation => text().nullable()();
  TextColumn get parentInvocation => text().nullable()();

  TextColumn get stackTrace => text().nullable()();
  TextColumn get error => text().nullable()();
}

@DriftDatabase(tables: [LogEntryEntities], daos: [LogDao])
class LogDatabase extends _$LogDatabase with DatabaseBackgroundMixin {
  LogDatabase.connect(super.connection) : super.connect();

  static Future<LogDatabase> connectToBackgroundIsolate() async {
    // create a moor executor in a new background isolate. If you want to start the isolate yourself, you
    // can also call MoorIsolate.inCurrent() from the background isolate
    final logDatabaseIsolate = await DatabaseBackgroundMixin.createMoorIsolate(
      'yalp_log_drift_db',
    );

    // we can now create a database connection that will use the isolate internally. This is NOT what's
    // returned from _backgroundConnection, moor uses an internal proxy class for isolate communication.
    final logDatabaseConnection = await logDatabaseIsolate.connect();

    return LogDatabase.connect(logDatabaseConnection);
  }

  @override
  int get schemaVersion => 1;

  @override
  String get dbFileName => 'yalp_log_drift_db';

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }
}

@DriftAccessor(tables: [LogEntryEntities])
class LogDao extends DatabaseAccessor<LogDatabase> with _$LogDaoMixin {
  LogDao(super.attachedDatabase);

  // MARK: Read
  Future<List<String>> getTags() {
    final query = selectOnly(logEntryEntities, distinct: true)
      ..addColumns([logEntryEntities.tag])
      ..where(logEntryEntities.tag.isNotNull());

    return query.map((r) => r.read(logEntryEntities.tag)).map((v) => v!).get();
  }

  Future<List<LogLevel>> getLevels() async {
    final query = selectOnly(logEntryEntities, distinct: true)
      ..addColumns([logEntryEntities.level]);

    final result = await query
        .map((r) => r.readWithConverter<LogLevel, int>(logEntryEntities.level))
        .get();

    return result.nonNulls.toList();
  }

  Future<List<String>> getClassnames() {
    final query = selectOnly(logEntryEntities, distinct: true)
      ..addColumns([logEntryEntities.className])
      ..where(logEntryEntities.className.isNotNull());

    return query
        .map((r) => r.read(logEntryEntities.className))
        .map((v) => v!)
        .get();
  }

  Future<List<LogEntryEntity>> getAllLogs() {
    final query = select(logEntryEntities)
      ..orderBy([(l) => OrderingTerm.desc(l.timestamp)]);

    return query.get();
  }

  Future<List<LogLevel>> getAllLevels() async {
    final query = selectOnly(logEntryEntities)
      ..addColumns([logEntryEntities.level]);

    final result = await query
        .map((r) => r.readWithConverter<LogLevel, int>(logEntryEntities.level))
        .get();

    return result.nonNulls.toList();
  }

  Future<List<LogEntryEntity>> getLogsFiltered(LogFilterOptions options) {
    final query = select(logEntryEntities);

    if (options.tags.isNotEmpty) {
      query.where((l) => l.tag.isIn(options.tags));
    }

    if (options.level.isNotEmpty) {
      query.where((l) => l.level.isIn(options.level.map((e) => e.index)));
    }

    if (options.classnames.isNotEmpty) {
      query.where((l) => l.className.isIn(options.classnames));
    }

    if (options.start case final start?) {
      query.where((l) => l.timestamp.isBiggerThanValue(start));
    }

    if (options.end case final end?) {
      query.where((l) => l.timestamp.isSmallerThanValue(end));
    }

    if (options.invocation case final invocation?) {
      query.where((l) => l.invocation.equals(invocation));
    }

    query.orderBy([(l) => OrderingTerm.desc(l.timestamp)]);

    if (options.limit case final limit?) {
      query.limit(limit, offset: options.offset);
    }

    return query.get();
  }

  Future<List<LogEntryEntity>> getLogsForInvocation(String invocation) {
    final query = select(logEntryEntities)
      ..where((l) => l.invocation.equals(invocation))
      ..orderBy([(l) => OrderingTerm.desc(l.timestamp)]);

    return query.get();
  }

  Future<List<LogEntryEntity>> getLogsForParentInvocation(
    String parentInvocation,
  ) {
    final query = select(logEntryEntities)
      ..where((l) => l.parentInvocation.equals(parentInvocation))
      ..orderBy([(l) => OrderingTerm.desc(l.timestamp)]);

    return query.get();
  }

  // MARK: Write
  Future<void> insertLog(LogEntry entry) async {
    into(logEntryEntities).insert(
      LogEntryEntitiesCompanion.insert(
        message: entry.message,
        timestamp: entry.timestamp,
        level: entry.level,
        tag: Value.absentIfNull(entry.tag),
        className: entry.className,
        functionName: entry.functionName,
        invocation: Value.absentIfNull(entry.invocation),
        parentInvocation: Value.absentIfNull(entry.parentInvocation),
        stackTrace: Value.absentIfNull(entry.stackTrace.toString()),
        error: Value.absentIfNull(entry.error?.toString()),
      ),
    );
  }

  Future<void> clear() async {
    await delete(logEntryEntities).go();
  }

  Future<void> deleteLogsOlderThan(DateTime date) async {
    await (delete(
      logEntryEntities,
    )..where((l) => l.timestamp.isSmallerThanValue(date))).go();
  }

  Future<void> deleteOutsideLimit(int limit) async {
    await transaction(() async {
      final total = await logEntryEntities.count().getSingle();

      if (total > limit) {
        final toDelete = total - limit;

        final query = selectOnly(logEntryEntities)
          ..addColumns([logEntryEntities.id])
          ..orderBy([OrderingTerm.asc(logEntryEntities.timestamp)])
          ..limit(toDelete);

        final idsToDelete = await query
            .map((r) => r.read(logEntryEntities.id))
            .get();

        await (delete(
          logEntryEntities,
        )..where((l) => l.id.isIn(idsToDelete.nonNulls))).go();
      }
    });
  }
}
