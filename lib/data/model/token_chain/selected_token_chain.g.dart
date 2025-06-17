// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_token_chain.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSelectedTokenChainCollection on Isar {
  IsarCollection<SelectedTokenChain> get selectedTokenChains =>
      this.collection();
}

const SelectedTokenChainSchema = CollectionSchema(
  name: r'SelectedTokenChain',
  id: -2614624367387837306,
  properties: {
    r'apiKey': PropertySchema(
      id: 0,
      name: r'apiKey',
      type: IsarType.string,
    ),
    r'balance': PropertySchema(
      id: 1,
      name: r'balance',
      type: IsarType.double,
    ),
    r'baseChain': PropertySchema(
      id: 2,
      name: r'baseChain',
      type: IsarType.string,
    ),
    r'baseLogo': PropertySchema(
      id: 3,
      name: r'baseLogo',
      type: IsarType.string,
    ),
    r'chainId': PropertySchema(
      id: 4,
      name: r'chainId',
      type: IsarType.string,
    ),
    r'chainType': PropertySchema(
      id: 5,
      name: r'chainType',
      type: IsarType.string,
    ),
    r'changePercent': PropertySchema(
      id: 6,
      name: r'changePercent',
      type: IsarType.string,
    ),
    r'coingeckoIdAPI': PropertySchema(
      id: 7,
      name: r'coingeckoIdAPI',
      type: IsarType.string,
    ),
    r'contractAddress': PropertySchema(
      id: 8,
      name: r'contractAddress',
      type: IsarType.string,
    ),
    r'decimal': PropertySchema(
      id: 9,
      name: r'decimal',
      type: IsarType.long,
    ),
    r'estimateUsd': PropertySchema(
      id: 10,
      name: r'estimateUsd',
      type: IsarType.double,
    ),
    r'explorer': PropertySchema(
      id: 11,
      name: r'explorer',
      type: IsarType.string,
    ),
    r'explorerApi': PropertySchema(
      id: 12,
      name: r'explorerApi',
      type: IsarType.string,
    ),
    r'isTestnet': PropertySchema(
      id: 13,
      name: r'isTestnet',
      type: IsarType.bool,
    ),
    r'logo': PropertySchema(
      id: 14,
      name: r'logo',
      type: IsarType.string,
    ),
    r'mnemonicAccount': PropertySchema(
      id: 15,
      name: r'mnemonicAccount',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 16,
      name: r'name',
      type: IsarType.string,
    ),
    r'networkId': PropertySchema(
      id: 17,
      name: r'networkId',
      type: IsarType.string,
    ),
    r'poolAddress': PropertySchema(
      id: 18,
      name: r'poolAddress',
      type: IsarType.string,
    ),
    r'rpc': PropertySchema(
      id: 19,
      name: r'rpc',
      type: IsarType.string,
    ),
    r'symbol': PropertySchema(
      id: 20,
      name: r'symbol',
      type: IsarType.string,
    ),
    r'wrapedAddress': PropertySchema(
      id: 21,
      name: r'wrapedAddress',
      type: IsarType.string,
    )
  },
  estimateSize: _selectedTokenChainEstimateSize,
  serialize: _selectedTokenChainSerialize,
  deserialize: _selectedTokenChainDeserialize,
  deserializeProp: _selectedTokenChainDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _selectedTokenChainGetId,
  getLinks: _selectedTokenChainGetLinks,
  attach: _selectedTokenChainAttach,
  version: '3.1.8',
);

int _selectedTokenChainEstimateSize(
  SelectedTokenChain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.apiKey;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
    final value = object.chainType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.changePercent;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.coingeckoIdAPI;
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
    final value = object.mnemonicAccount;
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
    final value = object.networkId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.poolAddress;
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
  {
    final value = object.wrapedAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _selectedTokenChainSerialize(
  SelectedTokenChain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.apiKey);
  writer.writeDouble(offsets[1], object.balance);
  writer.writeString(offsets[2], object.baseChain);
  writer.writeString(offsets[3], object.baseLogo);
  writer.writeString(offsets[4], object.chainId);
  writer.writeString(offsets[5], object.chainType);
  writer.writeString(offsets[6], object.changePercent);
  writer.writeString(offsets[7], object.coingeckoIdAPI);
  writer.writeString(offsets[8], object.contractAddress);
  writer.writeLong(offsets[9], object.decimal);
  writer.writeDouble(offsets[10], object.estimateUsd);
  writer.writeString(offsets[11], object.explorer);
  writer.writeString(offsets[12], object.explorerApi);
  writer.writeBool(offsets[13], object.isTestnet);
  writer.writeString(offsets[14], object.logo);
  writer.writeString(offsets[15], object.mnemonicAccount);
  writer.writeString(offsets[16], object.name);
  writer.writeString(offsets[17], object.networkId);
  writer.writeString(offsets[18], object.poolAddress);
  writer.writeString(offsets[19], object.rpc);
  writer.writeString(offsets[20], object.symbol);
  writer.writeString(offsets[21], object.wrapedAddress);
}

SelectedTokenChain _selectedTokenChainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SelectedTokenChain(
    apiKey: reader.readStringOrNull(offsets[0]),
    balance: reader.readDoubleOrNull(offsets[1]),
    baseChain: reader.readStringOrNull(offsets[2]),
    baseLogo: reader.readStringOrNull(offsets[3]),
    chainId: reader.readStringOrNull(offsets[4]),
    chainType: reader.readStringOrNull(offsets[5]),
    changePercent: reader.readStringOrNull(offsets[6]),
    coingeckoIdAPI: reader.readStringOrNull(offsets[7]),
    contractAddress: reader.readStringOrNull(offsets[8]),
    decimal: reader.readLongOrNull(offsets[9]),
    estimateUsd: reader.readDoubleOrNull(offsets[10]),
    explorer: reader.readStringOrNull(offsets[11]),
    explorerApi: reader.readStringOrNull(offsets[12]),
    id: id,
    isTestnet: reader.readBoolOrNull(offsets[13]),
    logo: reader.readStringOrNull(offsets[14]),
    mnemonicAccount: reader.readStringOrNull(offsets[15]),
    name: reader.readStringOrNull(offsets[16]),
    networkId: reader.readStringOrNull(offsets[17]),
    poolAddress: reader.readStringOrNull(offsets[18]),
    rpc: reader.readStringOrNull(offsets[19]),
    symbol: reader.readStringOrNull(offsets[20]),
    wrapedAddress: reader.readStringOrNull(offsets[21]),
  );
  return object;
}

P _selectedTokenChainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _selectedTokenChainGetId(SelectedTokenChain object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _selectedTokenChainGetLinks(
    SelectedTokenChain object) {
  return [];
}

void _selectedTokenChainAttach(
    IsarCollection<dynamic> col, Id id, SelectedTokenChain object) {
  object.id = id;
}

extension SelectedTokenChainQueryWhereSort
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QWhere> {
  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SelectedTokenChainQueryWhere
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QWhereClause> {
  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterWhereClause>
      idBetween(
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

extension SelectedTokenChainQueryFilter
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QFilterCondition> {
  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'apiKey',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'apiKey',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'apiKey',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'apiKey',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'apiKey',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      apiKeyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'apiKey',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      balanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      balanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      balanceEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      balanceLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      balanceBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseChain',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseChain',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseChain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseChain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseChain',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseChainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseChain',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baseLogo',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baseLogo',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baseLogo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baseLogo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baseLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      baseLogoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baseLogo',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdStartsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chainId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chainType',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chainType',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chainType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chainType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chainType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chainType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chainType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chainType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chainType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainType',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      chainTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chainType',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'changePercent',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'changePercent',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changePercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'changePercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'changePercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'changePercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'changePercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'changePercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'changePercent',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'changePercent',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'changePercent',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      changePercentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'changePercent',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coingeckoIdAPI',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coingeckoIdAPI',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coingeckoIdAPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coingeckoIdAPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPILessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coingeckoIdAPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coingeckoIdAPI',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coingeckoIdAPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coingeckoIdAPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coingeckoIdAPI',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coingeckoIdAPI',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coingeckoIdAPI',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      coingeckoIdAPIIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coingeckoIdAPI',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      contractAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'contractAddress',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      contractAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'contractAddress',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      contractAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'contractAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      contractAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'contractAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      contractAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'contractAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      contractAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'contractAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      decimalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'decimal',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      decimalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'decimal',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      decimalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'decimal',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      decimalLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      decimalBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      estimateUsdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'estimateUsd',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      estimateUsdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'estimateUsd',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      estimateUsdEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimateUsd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      estimateUsdGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimateUsd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      estimateUsdLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimateUsd',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      estimateUsdBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimateUsd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'explorer',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'explorer',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explorer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explorer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorer',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explorer',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerApiIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'explorerApi',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerApiIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'explorerApi',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerApiContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explorerApi',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerApiMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explorerApi',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerApiIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explorerApi',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      explorerApiIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explorerApi',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      isTestnetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isTestnet',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      isTestnetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isTestnet',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      isTestnetEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isTestnet',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logo',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoGreaterThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoStartsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      logoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logo',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mnemonicAccount',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mnemonicAccount',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mnemonicAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mnemonicAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mnemonicAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mnemonicAccount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mnemonicAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mnemonicAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mnemonicAccount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mnemonicAccount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mnemonicAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      mnemonicAccountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mnemonicAccount',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameGreaterThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'networkId',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'networkId',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'networkId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'networkId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'networkId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'networkId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'networkId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'networkId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'networkId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'networkId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'networkId',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      networkIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'networkId',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'poolAddress',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'poolAddress',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poolAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'poolAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'poolAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'poolAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'poolAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'poolAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'poolAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'poolAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'poolAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      poolAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'poolAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rpc',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rpc',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcGreaterThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcStartsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rpc',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rpc',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rpc',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      rpcIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rpc',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'symbol',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolEqualTo(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolGreaterThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolLessThan(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolBetween(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolStartsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolEndsWith(
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

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'symbol',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'symbol',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      symbolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'symbol',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'wrapedAddress',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'wrapedAddress',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrapedAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wrapedAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wrapedAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wrapedAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wrapedAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wrapedAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wrapedAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wrapedAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wrapedAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterFilterCondition>
      wrapedAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wrapedAddress',
        value: '',
      ));
    });
  }
}

extension SelectedTokenChainQueryObject
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QFilterCondition> {}

extension SelectedTokenChainQueryLinks
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QFilterCondition> {}

extension SelectedTokenChainQuerySortBy
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QSortBy> {
  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByBaseChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByBaseChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByBaseLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByBaseLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByChainId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByChainIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByChainType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainType', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByChainTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainType', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByChangePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByChangePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByCoingeckoIdAPI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coingeckoIdAPI', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByCoingeckoIdAPIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coingeckoIdAPI', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByContractAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByContractAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByDecimalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByEstimateUsd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateUsd', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByEstimateUsdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateUsd', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByExplorer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByExplorerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByExplorerApi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByExplorerApiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByIsTestnet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByIsTestnetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByMnemonicAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicAccount', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByMnemonicAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicAccount', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByNetworkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkId', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByNetworkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkId', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByPoolAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAddress', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByPoolAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAddress', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByRpc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByRpcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByWrapedAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrapedAddress', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      sortByWrapedAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrapedAddress', Sort.desc);
    });
  }
}

extension SelectedTokenChainQuerySortThenBy
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QSortThenBy> {
  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByApiKey() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByApiKeyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'apiKey', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByBaseChain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByBaseChainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseChain', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByBaseLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByBaseLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baseLogo', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByChainId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByChainIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainId', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByChainType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainType', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByChainTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chainType', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByChangePercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByChangePercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'changePercent', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByCoingeckoIdAPI() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coingeckoIdAPI', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByCoingeckoIdAPIDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coingeckoIdAPI', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByContractAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByContractAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contractAddress', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByDecimalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'decimal', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByEstimateUsd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateUsd', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByEstimateUsdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimateUsd', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByExplorer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByExplorerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorer', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByExplorerApi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByExplorerApiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explorerApi', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByIsTestnet() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByIsTestnetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isTestnet', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByLogo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByLogoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logo', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByMnemonicAccount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicAccount', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByMnemonicAccountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mnemonicAccount', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByNetworkId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkId', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByNetworkIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'networkId', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByPoolAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAddress', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByPoolAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'poolAddress', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByRpc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByRpcDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rpc', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenBySymbol() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenBySymbolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'symbol', Sort.desc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByWrapedAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrapedAddress', Sort.asc);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QAfterSortBy>
      thenByWrapedAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wrapedAddress', Sort.desc);
    });
  }
}

extension SelectedTokenChainQueryWhereDistinct
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct> {
  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByApiKey({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'apiKey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balance');
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByBaseChain({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseChain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByBaseLogo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baseLogo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByChainId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByChainType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByChangePercent({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'changePercent',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByCoingeckoIdAPI({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coingeckoIdAPI',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByContractAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contractAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByDecimal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'decimal');
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByEstimateUsd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimateUsd');
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByExplorer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explorer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByExplorerApi({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explorerApi', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByIsTestnet() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isTestnet');
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByLogo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByMnemonicAccount({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mnemonicAccount',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByNetworkId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'networkId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByPoolAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'poolAddress', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct> distinctByRpc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rpc', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctBySymbol({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'symbol', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SelectedTokenChain, SelectedTokenChain, QDistinct>
      distinctByWrapedAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wrapedAddress',
          caseSensitive: caseSensitive);
    });
  }
}

extension SelectedTokenChainQueryProperty
    on QueryBuilder<SelectedTokenChain, SelectedTokenChain, QQueryProperty> {
  QueryBuilder<SelectedTokenChain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations> apiKeyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'apiKey');
    });
  }

  QueryBuilder<SelectedTokenChain, double?, QQueryOperations>
      balanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balance');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      baseChainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseChain');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      baseLogoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baseLogo');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      chainIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainId');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      chainTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainType');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      changePercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'changePercent');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      coingeckoIdAPIProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coingeckoIdAPI');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      contractAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contractAddress');
    });
  }

  QueryBuilder<SelectedTokenChain, int?, QQueryOperations> decimalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'decimal');
    });
  }

  QueryBuilder<SelectedTokenChain, double?, QQueryOperations>
      estimateUsdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimateUsd');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      explorerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explorer');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      explorerApiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explorerApi');
    });
  }

  QueryBuilder<SelectedTokenChain, bool?, QQueryOperations>
      isTestnetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isTestnet');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations> logoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logo');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      mnemonicAccountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mnemonicAccount');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      networkIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'networkId');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      poolAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poolAddress');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations> rpcProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rpc');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations> symbolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'symbol');
    });
  }

  QueryBuilder<SelectedTokenChain, String?, QQueryOperations>
      wrapedAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wrapedAddress');
    });
  }
}
