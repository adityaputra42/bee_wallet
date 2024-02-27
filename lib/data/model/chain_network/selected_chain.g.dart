// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_chain.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSelectedChainCollection on Isar {
  IsarCollection<SelectedChain> get selectedChains => this.collection();
}

const SelectedChainSchema = CollectionSchema(
  name: r'SelectedChain',
  id: -799805590008884371,
  properties: {
    r'chainId': PropertySchema(
      id: 0,
      name: r'chainId',
      type: IsarType.stringList,
    )
  },
  estimateSize: _selectedChainEstimateSize,
  serialize: _selectedChainSerialize,
  deserialize: _selectedChainDeserialize,
  deserializeProp: _selectedChainDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _selectedChainGetId,
  getLinks: _selectedChainGetLinks,
  attach: _selectedChainAttach,
  version: '3.1.0+1',
);

int _selectedChainEstimateSize(
  SelectedChain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.chainId;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _selectedChainSerialize(
  SelectedChain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.chainId);
}

SelectedChain _selectedChainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SelectedChain(
    chainId: reader.readStringList(offsets[0]),
    id: id,
  );
  return object;
}

P _selectedChainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _selectedChainGetId(SelectedChain object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _selectedChainGetLinks(SelectedChain object) {
  return [];
}

void _selectedChainAttach(
    IsarCollection<dynamic> col, Id id, SelectedChain object) {
  object.id = id;
}

extension SelectedChainQueryWhereSort
    on QueryBuilder<SelectedChain, SelectedChain, QWhere> {
  QueryBuilder<SelectedChain, SelectedChain, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SelectedChainQueryWhere
    on QueryBuilder<SelectedChain, SelectedChain, QWhereClause> {
  QueryBuilder<SelectedChain, SelectedChain, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterWhereClause> idBetween(
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

extension SelectedChainQueryFilter
    on QueryBuilder<SelectedChain, SelectedChain, QFilterCondition> {
  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'chainId',
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementEqualTo(
    String value, {
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementGreaterThan(
    String value, {
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementLessThan(
    String value, {
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementBetween(
    String lower,
    String upper, {
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementStartsWith(
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementEndsWith(
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chainId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chainId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chainId',
        value: '',
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chainId',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chainId',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chainId',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chainId',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chainId',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      chainIdLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'chainId',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition>
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SelectedChain, SelectedChain, QAfterFilterCondition> idBetween(
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
}

extension SelectedChainQueryObject
    on QueryBuilder<SelectedChain, SelectedChain, QFilterCondition> {}

extension SelectedChainQueryLinks
    on QueryBuilder<SelectedChain, SelectedChain, QFilterCondition> {}

extension SelectedChainQuerySortBy
    on QueryBuilder<SelectedChain, SelectedChain, QSortBy> {}

extension SelectedChainQuerySortThenBy
    on QueryBuilder<SelectedChain, SelectedChain, QSortThenBy> {
  QueryBuilder<SelectedChain, SelectedChain, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SelectedChain, SelectedChain, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SelectedChainQueryWhereDistinct
    on QueryBuilder<SelectedChain, SelectedChain, QDistinct> {
  QueryBuilder<SelectedChain, SelectedChain, QDistinct> distinctByChainId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chainId');
    });
  }
}

extension SelectedChainQueryProperty
    on QueryBuilder<SelectedChain, SelectedChain, QQueryProperty> {
  QueryBuilder<SelectedChain, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SelectedChain, List<String>?, QQueryOperations>
      chainIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chainId');
    });
  }
}
