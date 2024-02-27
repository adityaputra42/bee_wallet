// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_chain.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTokenChainCollection on Isar {
  IsarCollection<TokenChain> get tokenChains => this.collection();
}

const TokenChainSchema = CollectionSchema(
  name: r'TokenChain',
  id: 4450043043910669729,
  properties: {
    r'balance': PropertySchema(
      id: 0,
      name: r'balance',
      type: IsarType.double,
    ),
    r'baseChain': PropertySchema(
      id: 1,
      name: r'baseChain',
      type: IsarType.string,
    ),
    r'baseLogo': PropertySchema(
      id: 2,
      name: r'baseLogo',
      type: IsarType.string,
    ),
    r'chainId': PropertySchema(
      id: 3,
      name: r'chainId',
      type: IsarType.string,
    ),
    r'contractAddress': PropertySchema(
      id: 4,
      name: r'contractAddress',
      type: IsarType.string,
    ),
    r'decimal': PropertySchema(
      id: 5,
      name: r'decimal',
      type: IsarType.long,
    ),
    r'explorer': PropertySchema(
      id: 6,
      name: r'explorer',
      type: IsarType.string,
    ),
    r'explorerApi': PropertySchema(
      id: 7,
      name: r'explorerApi',
      type: IsarType.string,
    ),
    r'isTestnet': PropertySchema(
      id: 8,
      name: r'isTestnet',
      type: IsarType.bool,
    ),
    r'logo': PropertySchema(
      id: 9,
      name: r'logo',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 10,
      name: r'name',
      type: IsarType.string,
    ),
    r'rpc': PropertySchema(
      id: 11,
      name: r'rpc',
      type: IsarType.string,
    ),
    r'symbol': PropertySchema(
      id: 12,
      name: r'symbol',
      type: IsarType.string,
    )
  },
  estimateSize: _tokenChainEstimateSize,
  serialize: _tokenChainSerialize,
  deserialize: _tokenChainDeserialize,
  deserializeProp: _tokenChainDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tokenChainGetId,
  getLinks: _tokenChainGetLinks,
  attach: _tokenChainAttach,
  version: '3.1.0+1',
);

int _tokenChainEstimateSize(
  TokenChain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.baseChain;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.baseLogo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.chainId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.contractAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.explorer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.explorerApi;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rpc;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.symbol;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tokenChainSerialize(
  TokenChain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.balance);
  writer.writeString(offsets[1], object.baseChain);
  writer.writeString(offsets[2], object.baseLogo);
  writer.writeString(offsets[3], object.chainId);
  writer.writeString(offsets[4], object.contractAddress);
  writer.writeLong(offsets[5], object.decimal);
  writer.writeString(offsets[6], object.explorer);
  writer.writeString(offsets[7], object.explorerApi);
  writer.writeBool(offsets[8], object.isTestnet);
  writer.writeString(offsets[9], object.logo);
  writer.writeString(offsets[10], object.name);
  writer.writeString(offsets[11], object.rpc);
  writer.writeString(offsets[12], object.symbol);
}

TokenChain _tokenChainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TokenChain(
    balance: reader.readDoubleOrNull(offsets[0]),
    baseChain: reader.readStringOrNull(offsets[1]),
    baseLogo: reader.readStringOrNull(offsets[2]),
    chainId: reader.readStringOrNull(offsets[3]),
    contractAddress: reader.readStringOrNull(offsets[4]),
    decimal: reader.readLongOrNull(offsets[5]),
    explorer: reader.readStringOrNull(offsets[6]),
    explorerApi: reader.readStringOrNull(offsets[7]),
    id: id,
    isTestnet: reader.readBoolOrNull(offsets[8]),
    logo: reader.readStringOrNull(offsets[9]),
    name: reader.readStringOrNull(offsets[10]),
    rpc: reader.readStringOrNull(offsets[11]),
    symbol: reader.readStringOrNull(offsets[12]),
  );
  return object;
}

P _tokenChainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tokenChainGetId(TokenChain object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _tokenChainGetLinks(TokenChain object) {
  return [];
}

void _tokenChainAttach(IsarCollection<dynamic> col, Id id, TokenChain object) {
  object.id = id;
}

extension TokenChainQueryWhereSort
    on QueryBuilder<TokenChain, TokenChain, QWhere> {
  QueryBuilder<TokenChain, TokenChain, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TokenChainQueryWhere
    on QueryBuilder<TokenChain, TokenChain, QWhereClause> {
  QueryBuilder<TokenChain, TokenChain, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TokenChain, TokenChain, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TokenChainQueryFilter
    on QueryBuilder<TokenChain, TokenChain, QFilterCondition> {
  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> balanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      balanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> balanceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      balanceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> balanceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> balanceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseChainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseChain',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseChainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseChain',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseChainEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseChainGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseChainLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseChainBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseChain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseChainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baseChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseChainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baseChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseChainContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseChainMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseChain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseChainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseChain',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseChainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseChain',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseLogoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseLogo',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseLogoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseLogo',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseLogoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseLogoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baseLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseLogoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baseLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseLogoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baseLogo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseLogoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baseLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseLogoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baseLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseLogoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> baseLogoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseLogo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseLogoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      baseLogoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      chainIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      chainIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chainId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chainId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> chainIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      chainIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractAddress',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractAddress',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'contractAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'contractAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'contractAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'contractAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'contractAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      contractAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> decimalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'decimal',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      decimalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'decimal',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> decimalEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'decimal',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      decimalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'decimal',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> decimalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'decimal',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> decimalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'decimal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> explorerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'explorer',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'explorer',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> explorerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explorer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> explorerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explorer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> explorerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explorer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explorer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> explorerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explorer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> explorerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explorer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> explorerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explorer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorer',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explorer',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'explorerApi',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'explorerApi',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorerApi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explorerApi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explorerApi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explorerApi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explorerApi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explorerApi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explorerApi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explorerApi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorerApi',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      explorerApiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explorerApi',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      isTestnetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isTestnet',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      isTestnetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isTestnet',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> isTestnetEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTestnet',
        value: value,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> logoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rpc',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rpc',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rpc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rpc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rpc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rpc',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rpc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rpc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rpc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rpc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rpc',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> rpcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rpc',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      symbolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'symbol',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition> symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }
}

extension TokenChainQueryObject
    on QueryBuilder<TokenChain, TokenChain, QFilterCondition> {}

extension TokenChainQueryLinks
    on QueryBuilder<TokenChain, TokenChain, QFilterCondition> {}

extension TokenChainQuerySortBy
    on QueryBuilder<TokenChain, TokenChain, QSortBy> {
  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByBaseChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByBaseChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByBaseLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByBaseLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByChainId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByChainIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByContractAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy>
      sortByContractAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByDecimalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByExplorer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByExplorerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByExplorerApi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByExplorerApiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByIsTestnet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByIsTestnetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByRpc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortByRpcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }
}

extension TokenChainQuerySortThenBy
    on QueryBuilder<TokenChain, TokenChain, QSortThenBy> {
  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByBaseChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByBaseChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByBaseLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByBaseLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByChainId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByChainIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByContractAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy>
      thenByContractAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByDecimalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByExplorer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByExplorerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByExplorerApi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByExplorerApiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByIsTestnet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByIsTestnetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByRpc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenByRpcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.desc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QAfterSortBy> thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }
}

extension TokenChainQueryWhereDistinct
    on QueryBuilder<TokenChain, TokenChain, QDistinct> {
  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balance');
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByBaseChain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseChain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByBaseLogo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseLogo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByChainId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByContractAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'decimal');
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByExplorer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explorer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByExplorerApi(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explorerApi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByIsTestnet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTestnet');
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByLogo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctByRpc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rpc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TokenChain, TokenChain, QDistinct> distinctBySymbol(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }
}

extension TokenChainQueryProperty
    on QueryBuilder<TokenChain, TokenChain, QQueryProperty> {
  QueryBuilder<TokenChain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TokenChain, double?, QQueryOperations> balanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balance');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> baseChainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseChain');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> baseLogoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseLogo');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> chainIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainId');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations>
      contractAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractAddress');
    });
  }

  QueryBuilder<TokenChain, int?, QQueryOperations> decimalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decimal');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> explorerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explorer');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> explorerApiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explorerApi');
    });
  }

  QueryBuilder<TokenChain, bool?, QQueryOperations> isTestnetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTestnet');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> logoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logo');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> rpcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rpc');
    });
  }

  QueryBuilder<TokenChain, String?, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }
}
