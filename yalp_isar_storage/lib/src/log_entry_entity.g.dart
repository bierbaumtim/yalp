// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_entry_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetLogEntryEntityCollection on Isar {
  IsarCollection<LogEntryEntity> get logEntries => this.collection();
}

const LogEntryEntitySchema = CollectionSchema(
  name: r'LogEntryEntity',
  id: -511787809530084639,
  properties: {
    r'className': PropertySchema(
      id: 0,
      name: r'className',
      type: IsarType.string,
    ),
    r'error': PropertySchema(id: 1, name: r'error', type: IsarType.string),
    r'functionName': PropertySchema(
      id: 2,
      name: r'functionName',
      type: IsarType.string,
    ),
    r'invocation': PropertySchema(
      id: 3,
      name: r'invocation',
      type: IsarType.string,
    ),
    r'level': PropertySchema(
      id: 4,
      name: r'level',
      type: IsarType.byte,
      enumMap: _LogEntryEntitylevelEnumValueMap,
    ),
    r'message': PropertySchema(id: 5, name: r'message', type: IsarType.string),
    r'parentInvocation': PropertySchema(
      id: 6,
      name: r'parentInvocation',
      type: IsarType.string,
    ),
    r'stackTrace': PropertySchema(
      id: 7,
      name: r'stackTrace',
      type: IsarType.string,
    ),
    r'tag': PropertySchema(id: 8, name: r'tag', type: IsarType.string),
    r'timestamp': PropertySchema(
      id: 9,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
  },
  estimateSize: _logEntryEntityEstimateSize,
  serialize: _logEntryEntitySerialize,
  deserialize: _logEntryEntityDeserialize,
  deserializeProp: _logEntryEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'level': IndexSchema(
      id: -730704511986726349,
      name: r'level',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'level',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'tag': IndexSchema(
      id: -8827799455852696894,
      name: r'tag',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tag',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'invocation': IndexSchema(
      id: -2810775489279597063,
      name: r'invocation',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'invocation',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},
  getId: _logEntryEntityGetId,
  getLinks: _logEntryEntityGetLinks,
  attach: _logEntryEntityAttach,
  version: '3.1.0+1',
);

int _logEntryEntityEstimateSize(
  LogEntryEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.className.length * 3;
  {
    final value = object.error;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.functionName.length * 3;
  {
    final value = object.invocation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.message.length * 3;
  {
    final value = object.parentInvocation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stackTrace;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tag;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _logEntryEntitySerialize(
  LogEntryEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.className);
  writer.writeString(offsets[1], object.error);
  writer.writeString(offsets[2], object.functionName);
  writer.writeString(offsets[3], object.invocation);
  writer.writeByte(offsets[4], object.level.index);
  writer.writeString(offsets[5], object.message);
  writer.writeString(offsets[6], object.parentInvocation);
  writer.writeString(offsets[7], object.stackTrace);
  writer.writeString(offsets[8], object.tag);
  writer.writeDateTime(offsets[9], object.timestamp);
}

LogEntryEntity _logEntryEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = LogEntryEntity(
    className: reader.readString(offsets[0]),
    error: reader.readStringOrNull(offsets[1]),
    functionName: reader.readString(offsets[2]),
    id: id,
    invocation: reader.readStringOrNull(offsets[3]),
    level:
        _LogEntryEntitylevelValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        LogLevel.trace,
    message: reader.readString(offsets[5]),
    parentInvocation: reader.readStringOrNull(offsets[6]),
    stackTrace: reader.readStringOrNull(offsets[7]),
    tag: reader.readStringOrNull(offsets[8]),
    timestamp: reader.readDateTime(offsets[9]),
  );
  return object;
}

P _logEntryEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (_LogEntryEntitylevelValueEnumMap[reader.readByteOrNull(offset)] ??
              LogLevel.trace)
          as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _LogEntryEntitylevelEnumValueMap = {
  'trace': 0,
  'debug': 1,
  'info': 2,
  'warning': 3,
  'error': 4,
  'fatal': 5,
};
const _LogEntryEntitylevelValueEnumMap = {
  0: LogLevel.trace,
  1: LogLevel.debug,
  2: LogLevel.info,
  3: LogLevel.warning,
  4: LogLevel.error,
  5: LogLevel.fatal,
};

Id _logEntryEntityGetId(LogEntryEntity object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _logEntryEntityGetLinks(LogEntryEntity object) {
  return [];
}

void _logEntryEntityAttach(
  IsarCollection<dynamic> col,
  Id id,
  LogEntryEntity object,
) {
  object.id = id;
}

extension LogEntryEntityQueryWhereSort
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QWhere> {
  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhere> anyLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'level'),
      );
    });
  }
}

extension LogEntryEntityQueryWhere
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QWhereClause> {
  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> levelEqualTo(
    LogLevel level,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'level', value: [level]),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause>
  levelNotEqualTo(LogLevel level) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [],
                upper: [level],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [level],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [level],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'level',
                lower: [],
                upper: [level],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause>
  levelGreaterThan(LogLevel level, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'level',
          lower: [level],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> levelLessThan(
    LogLevel level, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'level',
          lower: [],
          upper: [level],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> levelBetween(
    LogLevel lowerLevel,
    LogLevel upperLevel, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'level',
          lower: [lowerLevel],
          includeLower: includeLower,
          upper: [upperLevel],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> tagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tag', value: [null]),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause>
  tagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'tag',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> tagEqualTo(
    String? tag,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'tag', value: [tag]),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause> tagNotEqualTo(
    String? tag,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [],
                upper: [tag],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [tag],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [tag],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'tag',
                lower: [],
                upper: [tag],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause>
  invocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'invocation', value: [null]),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause>
  invocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'invocation',
          lower: [null],
          includeLower: false,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause>
  invocationEqualTo(String? invocation) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'invocation', value: [invocation]),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterWhereClause>
  invocationNotEqualTo(String? invocation) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'invocation',
                lower: [],
                upper: [invocation],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'invocation',
                lower: [invocation],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'invocation',
                lower: [invocation],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'invocation',
                lower: [],
                upper: [invocation],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension LogEntryEntityQueryFilter
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QFilterCondition> {
  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'className',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'className',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'className',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'className', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  classNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'className', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'error'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'error'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'error',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'error',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'error',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'error', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  errorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'error', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'functionName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'functionName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'functionName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'functionName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'functionName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'functionName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'functionName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'functionName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'functionName', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  functionNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'functionName', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'id'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'id'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition> idEqualTo(
    Id? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  idGreaterThan(Id? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  idLessThan(Id? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'invocation'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'invocation'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'invocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'invocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'invocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'invocation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'invocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'invocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'invocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'invocation',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'invocation', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  invocationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'invocation', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  levelEqualTo(LogLevel value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'level', value: value),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  levelGreaterThan(LogLevel value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'level',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  levelLessThan(LogLevel value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'level',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  levelBetween(
    LogLevel lower,
    LogLevel upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'level',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'message',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'message',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'message',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  messageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'message', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'parentInvocation'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'parentInvocation'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'parentInvocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'parentInvocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'parentInvocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'parentInvocation',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'parentInvocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'parentInvocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'parentInvocation',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'parentInvocation',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'parentInvocation', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  parentInvocationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'parentInvocation', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'stackTrace'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'stackTrace'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stackTrace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stackTrace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stackTrace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stackTrace',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stackTrace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stackTrace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stackTrace',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stackTrace',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stackTrace', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  stackTraceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stackTrace', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tag'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tag'),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tag',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tag',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tag',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tag', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  tagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tag', value: ''),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'timestamp', value: value),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  timestampGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  timestampLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'timestamp',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterFilterCondition>
  timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'timestamp',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension LogEntryEntityQueryObject
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QFilterCondition> {}

extension LogEntryEntityQueryLinks
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QFilterCondition> {}

extension LogEntryEntityQuerySortBy
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QSortBy> {
  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByFunctionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'functionName', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByFunctionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'functionName', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByInvocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invocation', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByInvocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invocation', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByParentInvocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentInvocation', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByParentInvocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentInvocation', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByStackTrace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByStackTraceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension LogEntryEntityQuerySortThenBy
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QSortThenBy> {
  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByClassName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByClassNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'className', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByError() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByErrorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'error', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByFunctionName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'functionName', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByFunctionNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'functionName', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByInvocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invocation', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByInvocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invocation', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByMessage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByMessageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'message', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByParentInvocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentInvocation', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByParentInvocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parentInvocation', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByStackTrace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByStackTraceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stackTrace', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByTag() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByTagDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tag', Sort.desc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QAfterSortBy>
  thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension LogEntryEntityQueryWhereDistinct
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> {
  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> distinctByClassName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'className', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> distinctByError({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'error', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct>
  distinctByFunctionName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'functionName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> distinctByInvocation({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invocation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> distinctByMessage({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'message', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct>
  distinctByParentInvocation({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'parentInvocation',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> distinctByStackTrace({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stackTrace', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct> distinctByTag({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tag', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<LogEntryEntity, LogEntryEntity, QDistinct>
  distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension LogEntryEntityQueryProperty
    on QueryBuilder<LogEntryEntity, LogEntryEntity, QQueryProperty> {
  QueryBuilder<LogEntryEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<LogEntryEntity, String, QQueryOperations> classNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'className');
    });
  }

  QueryBuilder<LogEntryEntity, String?, QQueryOperations> errorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'error');
    });
  }

  QueryBuilder<LogEntryEntity, String, QQueryOperations>
  functionNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'functionName');
    });
  }

  QueryBuilder<LogEntryEntity, String?, QQueryOperations> invocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invocation');
    });
  }

  QueryBuilder<LogEntryEntity, LogLevel, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<LogEntryEntity, String, QQueryOperations> messageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'message');
    });
  }

  QueryBuilder<LogEntryEntity, String?, QQueryOperations>
  parentInvocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parentInvocation');
    });
  }

  QueryBuilder<LogEntryEntity, String?, QQueryOperations> stackTraceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stackTrace');
    });
  }

  QueryBuilder<LogEntryEntity, String?, QQueryOperations> tagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tag');
    });
  }

  QueryBuilder<LogEntryEntity, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
