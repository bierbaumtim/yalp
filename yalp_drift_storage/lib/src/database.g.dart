// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LogEntryEntitiesTable extends LogEntryEntities
    with TableInfo<$LogEntryEntitiesTable, LogEntryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogEntryEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timestampMeta = const VerificationMeta(
    'timestamp',
  );
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
    'timestamp',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<LogLevel, int> level =
      GeneratedColumn<int>(
        'level',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<LogLevel>($LogEntryEntitiesTable.$converterlevel);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
    'tag',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _classNameMeta = const VerificationMeta(
    'className',
  );
  @override
  late final GeneratedColumn<String> className = GeneratedColumn<String>(
    'class_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _functionNameMeta = const VerificationMeta(
    'functionName',
  );
  @override
  late final GeneratedColumn<String> functionName = GeneratedColumn<String>(
    'function_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _invocationMeta = const VerificationMeta(
    'invocation',
  );
  @override
  late final GeneratedColumn<String> invocation = GeneratedColumn<String>(
    'invocation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _parentInvocationMeta = const VerificationMeta(
    'parentInvocation',
  );
  @override
  late final GeneratedColumn<String> parentInvocation = GeneratedColumn<String>(
    'parent_invocation',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _stackTraceMeta = const VerificationMeta(
    'stackTrace',
  );
  @override
  late final GeneratedColumn<String> stackTrace = GeneratedColumn<String>(
    'stack_trace',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _errorMeta = const VerificationMeta('error');
  @override
  late final GeneratedColumn<String> error = GeneratedColumn<String>(
    'error',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    message,
    timestamp,
    level,
    tag,
    className,
    functionName,
    invocation,
    parentInvocation,
    stackTrace,
    error,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_entry_entities';
  @override
  VerificationContext validateIntegrity(
    Insertable<LogEntryEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(
        _timestampMeta,
        timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta),
      );
    } else if (isInserting) {
      context.missing(_timestampMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
        _tagMeta,
        tag.isAcceptableOrUnknown(data['tag']!, _tagMeta),
      );
    }
    if (data.containsKey('class_name')) {
      context.handle(
        _classNameMeta,
        className.isAcceptableOrUnknown(data['class_name']!, _classNameMeta),
      );
    } else if (isInserting) {
      context.missing(_classNameMeta);
    }
    if (data.containsKey('function_name')) {
      context.handle(
        _functionNameMeta,
        functionName.isAcceptableOrUnknown(
          data['function_name']!,
          _functionNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_functionNameMeta);
    }
    if (data.containsKey('invocation')) {
      context.handle(
        _invocationMeta,
        invocation.isAcceptableOrUnknown(data['invocation']!, _invocationMeta),
      );
    }
    if (data.containsKey('parent_invocation')) {
      context.handle(
        _parentInvocationMeta,
        parentInvocation.isAcceptableOrUnknown(
          data['parent_invocation']!,
          _parentInvocationMeta,
        ),
      );
    }
    if (data.containsKey('stack_trace')) {
      context.handle(
        _stackTraceMeta,
        stackTrace.isAcceptableOrUnknown(data['stack_trace']!, _stackTraceMeta),
      );
    }
    if (data.containsKey('error')) {
      context.handle(
        _errorMeta,
        error.isAcceptableOrUnknown(data['error']!, _errorMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogEntryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogEntryEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      timestamp: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}timestamp'],
      )!,
      level: $LogEntryEntitiesTable.$converterlevel.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}level'],
        )!,
      ),
      tag: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tag'],
      ),
      className: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}class_name'],
      )!,
      functionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}function_name'],
      )!,
      invocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}invocation'],
      ),
      parentInvocation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_invocation'],
      ),
      stackTrace: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}stack_trace'],
      ),
      error: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error'],
      ),
    );
  }

  @override
  $LogEntryEntitiesTable createAlias(String alias) {
    return $LogEntryEntitiesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<LogLevel, int, int> $converterlevel =
      const EnumIndexConverter<LogLevel>(LogLevel.values);
}

class LogEntryEntity extends DataClass implements Insertable<LogEntryEntity> {
  final int id;
  final String message;
  final DateTime timestamp;
  final LogLevel level;
  final String? tag;
  final String className;
  final String functionName;
  final String? invocation;
  final String? parentInvocation;
  final String? stackTrace;
  final String? error;
  const LogEntryEntity({
    required this.id,
    required this.message,
    required this.timestamp,
    required this.level,
    this.tag,
    required this.className,
    required this.functionName,
    this.invocation,
    this.parentInvocation,
    this.stackTrace,
    this.error,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['message'] = Variable<String>(message);
    map['timestamp'] = Variable<DateTime>(timestamp);
    {
      map['level'] = Variable<int>(
        $LogEntryEntitiesTable.$converterlevel.toSql(level),
      );
    }
    if (!nullToAbsent || tag != null) {
      map['tag'] = Variable<String>(tag);
    }
    map['class_name'] = Variable<String>(className);
    map['function_name'] = Variable<String>(functionName);
    if (!nullToAbsent || invocation != null) {
      map['invocation'] = Variable<String>(invocation);
    }
    if (!nullToAbsent || parentInvocation != null) {
      map['parent_invocation'] = Variable<String>(parentInvocation);
    }
    if (!nullToAbsent || stackTrace != null) {
      map['stack_trace'] = Variable<String>(stackTrace);
    }
    if (!nullToAbsent || error != null) {
      map['error'] = Variable<String>(error);
    }
    return map;
  }

  LogEntryEntitiesCompanion toCompanion(bool nullToAbsent) {
    return LogEntryEntitiesCompanion(
      id: Value(id),
      message: Value(message),
      timestamp: Value(timestamp),
      level: Value(level),
      tag: tag == null && nullToAbsent ? const Value.absent() : Value(tag),
      className: Value(className),
      functionName: Value(functionName),
      invocation: invocation == null && nullToAbsent
          ? const Value.absent()
          : Value(invocation),
      parentInvocation: parentInvocation == null && nullToAbsent
          ? const Value.absent()
          : Value(parentInvocation),
      stackTrace: stackTrace == null && nullToAbsent
          ? const Value.absent()
          : Value(stackTrace),
      error: error == null && nullToAbsent
          ? const Value.absent()
          : Value(error),
    );
  }

  factory LogEntryEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogEntryEntity(
      id: serializer.fromJson<int>(json['id']),
      message: serializer.fromJson<String>(json['message']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
      level: $LogEntryEntitiesTable.$converterlevel.fromJson(
        serializer.fromJson<int>(json['level']),
      ),
      tag: serializer.fromJson<String?>(json['tag']),
      className: serializer.fromJson<String>(json['className']),
      functionName: serializer.fromJson<String>(json['functionName']),
      invocation: serializer.fromJson<String?>(json['invocation']),
      parentInvocation: serializer.fromJson<String?>(json['parentInvocation']),
      stackTrace: serializer.fromJson<String?>(json['stackTrace']),
      error: serializer.fromJson<String?>(json['error']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'message': serializer.toJson<String>(message),
      'timestamp': serializer.toJson<DateTime>(timestamp),
      'level': serializer.toJson<int>(
        $LogEntryEntitiesTable.$converterlevel.toJson(level),
      ),
      'tag': serializer.toJson<String?>(tag),
      'className': serializer.toJson<String>(className),
      'functionName': serializer.toJson<String>(functionName),
      'invocation': serializer.toJson<String?>(invocation),
      'parentInvocation': serializer.toJson<String?>(parentInvocation),
      'stackTrace': serializer.toJson<String?>(stackTrace),
      'error': serializer.toJson<String?>(error),
    };
  }

  LogEntryEntity copyWith({
    int? id,
    String? message,
    DateTime? timestamp,
    LogLevel? level,
    Value<String?> tag = const Value.absent(),
    String? className,
    String? functionName,
    Value<String?> invocation = const Value.absent(),
    Value<String?> parentInvocation = const Value.absent(),
    Value<String?> stackTrace = const Value.absent(),
    Value<String?> error = const Value.absent(),
  }) => LogEntryEntity(
    id: id ?? this.id,
    message: message ?? this.message,
    timestamp: timestamp ?? this.timestamp,
    level: level ?? this.level,
    tag: tag.present ? tag.value : this.tag,
    className: className ?? this.className,
    functionName: functionName ?? this.functionName,
    invocation: invocation.present ? invocation.value : this.invocation,
    parentInvocation: parentInvocation.present
        ? parentInvocation.value
        : this.parentInvocation,
    stackTrace: stackTrace.present ? stackTrace.value : this.stackTrace,
    error: error.present ? error.value : this.error,
  );
  LogEntryEntity copyWithCompanion(LogEntryEntitiesCompanion data) {
    return LogEntryEntity(
      id: data.id.present ? data.id.value : this.id,
      message: data.message.present ? data.message.value : this.message,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
      level: data.level.present ? data.level.value : this.level,
      tag: data.tag.present ? data.tag.value : this.tag,
      className: data.className.present ? data.className.value : this.className,
      functionName: data.functionName.present
          ? data.functionName.value
          : this.functionName,
      invocation: data.invocation.present
          ? data.invocation.value
          : this.invocation,
      parentInvocation: data.parentInvocation.present
          ? data.parentInvocation.value
          : this.parentInvocation,
      stackTrace: data.stackTrace.present
          ? data.stackTrace.value
          : this.stackTrace,
      error: data.error.present ? data.error.value : this.error,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LogEntryEntity(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp, ')
          ..write('level: $level, ')
          ..write('tag: $tag, ')
          ..write('className: $className, ')
          ..write('functionName: $functionName, ')
          ..write('invocation: $invocation, ')
          ..write('parentInvocation: $parentInvocation, ')
          ..write('stackTrace: $stackTrace, ')
          ..write('error: $error')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    message,
    timestamp,
    level,
    tag,
    className,
    functionName,
    invocation,
    parentInvocation,
    stackTrace,
    error,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogEntryEntity &&
          other.id == this.id &&
          other.message == this.message &&
          other.timestamp == this.timestamp &&
          other.level == this.level &&
          other.tag == this.tag &&
          other.className == this.className &&
          other.functionName == this.functionName &&
          other.invocation == this.invocation &&
          other.parentInvocation == this.parentInvocation &&
          other.stackTrace == this.stackTrace &&
          other.error == this.error);
}

class LogEntryEntitiesCompanion extends UpdateCompanion<LogEntryEntity> {
  final Value<int> id;
  final Value<String> message;
  final Value<DateTime> timestamp;
  final Value<LogLevel> level;
  final Value<String?> tag;
  final Value<String> className;
  final Value<String> functionName;
  final Value<String?> invocation;
  final Value<String?> parentInvocation;
  final Value<String?> stackTrace;
  final Value<String?> error;
  const LogEntryEntitiesCompanion({
    this.id = const Value.absent(),
    this.message = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.level = const Value.absent(),
    this.tag = const Value.absent(),
    this.className = const Value.absent(),
    this.functionName = const Value.absent(),
    this.invocation = const Value.absent(),
    this.parentInvocation = const Value.absent(),
    this.stackTrace = const Value.absent(),
    this.error = const Value.absent(),
  });
  LogEntryEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required String message,
    required DateTime timestamp,
    required LogLevel level,
    this.tag = const Value.absent(),
    required String className,
    required String functionName,
    this.invocation = const Value.absent(),
    this.parentInvocation = const Value.absent(),
    this.stackTrace = const Value.absent(),
    this.error = const Value.absent(),
  }) : message = Value(message),
       timestamp = Value(timestamp),
       level = Value(level),
       className = Value(className),
       functionName = Value(functionName);
  static Insertable<LogEntryEntity> custom({
    Expression<int>? id,
    Expression<String>? message,
    Expression<DateTime>? timestamp,
    Expression<int>? level,
    Expression<String>? tag,
    Expression<String>? className,
    Expression<String>? functionName,
    Expression<String>? invocation,
    Expression<String>? parentInvocation,
    Expression<String>? stackTrace,
    Expression<String>? error,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (message != null) 'message': message,
      if (timestamp != null) 'timestamp': timestamp,
      if (level != null) 'level': level,
      if (tag != null) 'tag': tag,
      if (className != null) 'class_name': className,
      if (functionName != null) 'function_name': functionName,
      if (invocation != null) 'invocation': invocation,
      if (parentInvocation != null) 'parent_invocation': parentInvocation,
      if (stackTrace != null) 'stack_trace': stackTrace,
      if (error != null) 'error': error,
    });
  }

  LogEntryEntitiesCompanion copyWith({
    Value<int>? id,
    Value<String>? message,
    Value<DateTime>? timestamp,
    Value<LogLevel>? level,
    Value<String?>? tag,
    Value<String>? className,
    Value<String>? functionName,
    Value<String?>? invocation,
    Value<String?>? parentInvocation,
    Value<String?>? stackTrace,
    Value<String?>? error,
  }) {
    return LogEntryEntitiesCompanion(
      id: id ?? this.id,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      level: level ?? this.level,
      tag: tag ?? this.tag,
      className: className ?? this.className,
      functionName: functionName ?? this.functionName,
      invocation: invocation ?? this.invocation,
      parentInvocation: parentInvocation ?? this.parentInvocation,
      stackTrace: stackTrace ?? this.stackTrace,
      error: error ?? this.error,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(
        $LogEntryEntitiesTable.$converterlevel.toSql(level.value),
      );
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (className.present) {
      map['class_name'] = Variable<String>(className.value);
    }
    if (functionName.present) {
      map['function_name'] = Variable<String>(functionName.value);
    }
    if (invocation.present) {
      map['invocation'] = Variable<String>(invocation.value);
    }
    if (parentInvocation.present) {
      map['parent_invocation'] = Variable<String>(parentInvocation.value);
    }
    if (stackTrace.present) {
      map['stack_trace'] = Variable<String>(stackTrace.value);
    }
    if (error.present) {
      map['error'] = Variable<String>(error.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogEntryEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('message: $message, ')
          ..write('timestamp: $timestamp, ')
          ..write('level: $level, ')
          ..write('tag: $tag, ')
          ..write('className: $className, ')
          ..write('functionName: $functionName, ')
          ..write('invocation: $invocation, ')
          ..write('parentInvocation: $parentInvocation, ')
          ..write('stackTrace: $stackTrace, ')
          ..write('error: $error')
          ..write(')'))
        .toString();
  }
}

abstract class _$LogDatabase extends GeneratedDatabase {
  _$LogDatabase(QueryExecutor e) : super(e);
  _$LogDatabase.connect(DatabaseConnection c) : super.connect(c);
  $LogDatabaseManager get managers => $LogDatabaseManager(this);
  late final $LogEntryEntitiesTable logEntryEntities = $LogEntryEntitiesTable(
    this,
  );
  late final Index logEntriesLevel = Index(
    'log_entries_level',
    'CREATE INDEX log_entries_level ON log_entry_entities (level)',
  );
  late final Index logEntriesTag = Index(
    'log_entries_tag',
    'CREATE INDEX log_entries_tag ON log_entry_entities (tag)',
  );
  late final Index logEntriesInvocation = Index(
    'log_entries_invocation',
    'CREATE INDEX log_entries_invocation ON log_entry_entities (invocation)',
  );
  late final LogDao logDao = LogDao(this as LogDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    logEntryEntities,
    logEntriesLevel,
    logEntriesTag,
    logEntriesInvocation,
  ];
}

typedef $$LogEntryEntitiesTableCreateCompanionBuilder =
    LogEntryEntitiesCompanion Function({
      Value<int> id,
      required String message,
      required DateTime timestamp,
      required LogLevel level,
      Value<String?> tag,
      required String className,
      required String functionName,
      Value<String?> invocation,
      Value<String?> parentInvocation,
      Value<String?> stackTrace,
      Value<String?> error,
    });
typedef $$LogEntryEntitiesTableUpdateCompanionBuilder =
    LogEntryEntitiesCompanion Function({
      Value<int> id,
      Value<String> message,
      Value<DateTime> timestamp,
      Value<LogLevel> level,
      Value<String?> tag,
      Value<String> className,
      Value<String> functionName,
      Value<String?> invocation,
      Value<String?> parentInvocation,
      Value<String?> stackTrace,
      Value<String?> error,
    });

class $$LogEntryEntitiesTableFilterComposer
    extends Composer<_$LogDatabase, $LogEntryEntitiesTable> {
  $$LogEntryEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LogLevel, LogLevel, int> get level =>
      $composableBuilder(
        column: $table.level,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get functionName => $composableBuilder(
    column: $table.functionName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get invocation => $composableBuilder(
    column: $table.invocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentInvocation => $composableBuilder(
    column: $table.parentInvocation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get stackTrace => $composableBuilder(
    column: $table.stackTrace,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LogEntryEntitiesTableOrderingComposer
    extends Composer<_$LogDatabase, $LogEntryEntitiesTable> {
  $$LogEntryEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
    column: $table.timestamp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tag => $composableBuilder(
    column: $table.tag,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get className => $composableBuilder(
    column: $table.className,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get functionName => $composableBuilder(
    column: $table.functionName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get invocation => $composableBuilder(
    column: $table.invocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentInvocation => $composableBuilder(
    column: $table.parentInvocation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get stackTrace => $composableBuilder(
    column: $table.stackTrace,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get error => $composableBuilder(
    column: $table.error,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LogEntryEntitiesTableAnnotationComposer
    extends Composer<_$LogDatabase, $LogEntryEntitiesTable> {
  $$LogEntryEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LogLevel, int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<String> get tag =>
      $composableBuilder(column: $table.tag, builder: (column) => column);

  GeneratedColumn<String> get className =>
      $composableBuilder(column: $table.className, builder: (column) => column);

  GeneratedColumn<String> get functionName => $composableBuilder(
    column: $table.functionName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get invocation => $composableBuilder(
    column: $table.invocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentInvocation => $composableBuilder(
    column: $table.parentInvocation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get stackTrace => $composableBuilder(
    column: $table.stackTrace,
    builder: (column) => column,
  );

  GeneratedColumn<String> get error =>
      $composableBuilder(column: $table.error, builder: (column) => column);
}

class $$LogEntryEntitiesTableTableManager
    extends
        RootTableManager<
          _$LogDatabase,
          $LogEntryEntitiesTable,
          LogEntryEntity,
          $$LogEntryEntitiesTableFilterComposer,
          $$LogEntryEntitiesTableOrderingComposer,
          $$LogEntryEntitiesTableAnnotationComposer,
          $$LogEntryEntitiesTableCreateCompanionBuilder,
          $$LogEntryEntitiesTableUpdateCompanionBuilder,
          (
            LogEntryEntity,
            BaseReferences<
              _$LogDatabase,
              $LogEntryEntitiesTable,
              LogEntryEntity
            >,
          ),
          LogEntryEntity,
          PrefetchHooks Function()
        > {
  $$LogEntryEntitiesTableTableManager(
    _$LogDatabase db,
    $LogEntryEntitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogEntryEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogEntryEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogEntryEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<DateTime> timestamp = const Value.absent(),
                Value<LogLevel> level = const Value.absent(),
                Value<String?> tag = const Value.absent(),
                Value<String> className = const Value.absent(),
                Value<String> functionName = const Value.absent(),
                Value<String?> invocation = const Value.absent(),
                Value<String?> parentInvocation = const Value.absent(),
                Value<String?> stackTrace = const Value.absent(),
                Value<String?> error = const Value.absent(),
              }) => LogEntryEntitiesCompanion(
                id: id,
                message: message,
                timestamp: timestamp,
                level: level,
                tag: tag,
                className: className,
                functionName: functionName,
                invocation: invocation,
                parentInvocation: parentInvocation,
                stackTrace: stackTrace,
                error: error,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String message,
                required DateTime timestamp,
                required LogLevel level,
                Value<String?> tag = const Value.absent(),
                required String className,
                required String functionName,
                Value<String?> invocation = const Value.absent(),
                Value<String?> parentInvocation = const Value.absent(),
                Value<String?> stackTrace = const Value.absent(),
                Value<String?> error = const Value.absent(),
              }) => LogEntryEntitiesCompanion.insert(
                id: id,
                message: message,
                timestamp: timestamp,
                level: level,
                tag: tag,
                className: className,
                functionName: functionName,
                invocation: invocation,
                parentInvocation: parentInvocation,
                stackTrace: stackTrace,
                error: error,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LogEntryEntitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$LogDatabase,
      $LogEntryEntitiesTable,
      LogEntryEntity,
      $$LogEntryEntitiesTableFilterComposer,
      $$LogEntryEntitiesTableOrderingComposer,
      $$LogEntryEntitiesTableAnnotationComposer,
      $$LogEntryEntitiesTableCreateCompanionBuilder,
      $$LogEntryEntitiesTableUpdateCompanionBuilder,
      (
        LogEntryEntity,
        BaseReferences<_$LogDatabase, $LogEntryEntitiesTable, LogEntryEntity>,
      ),
      LogEntryEntity,
      PrefetchHooks Function()
    >;

class $LogDatabaseManager {
  final _$LogDatabase _db;
  $LogDatabaseManager(this._db);
  $$LogEntryEntitiesTableTableManager get logEntryEntities =>
      $$LogEntryEntitiesTableTableManager(_db, _db.logEntryEntities);
}

mixin _$LogDaoMixin on DatabaseAccessor<LogDatabase> {
  $LogEntryEntitiesTable get logEntryEntities =>
      attachedDatabase.logEntryEntities;
}
