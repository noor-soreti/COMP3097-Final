// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ItemDBTable extends ItemDB with TableInfo<$ItemDBTable, ItemDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemMeta = const VerificationMeta('item');
  @override
  late final GeneratedColumn<String> item = GeneratedColumn<String>(
      'item', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, item, quantity, price];
  @override
  String get aliasedName => _alias ?? 'item_d_b';
  @override
  String get actualTableName => 'item_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<ItemDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item']!, _itemMeta));
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemDBData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      item: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $ItemDBTable createAlias(String alias) {
    return $ItemDBTable(attachedDatabase, alias);
  }
}

class ItemDBData extends DataClass implements Insertable<ItemDBData> {
  final int id;
  final String item;
  final int quantity;
  final int price;
  const ItemDBData(
      {required this.id,
      required this.item,
      required this.quantity,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item'] = Variable<String>(item);
    map['quantity'] = Variable<int>(quantity);
    map['price'] = Variable<int>(price);
    return map;
  }

  ItemDBCompanion toCompanion(bool nullToAbsent) {
    return ItemDBCompanion(
      id: Value(id),
      item: Value(item),
      quantity: Value(quantity),
      price: Value(price),
    );
  }

  factory ItemDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemDBData(
      id: serializer.fromJson<int>(json['id']),
      item: serializer.fromJson<String>(json['item']),
      quantity: serializer.fromJson<int>(json['quantity']),
      price: serializer.fromJson<int>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'item': serializer.toJson<String>(item),
      'quantity': serializer.toJson<int>(quantity),
      'price': serializer.toJson<int>(price),
    };
  }

  ItemDBData copyWith({int? id, String? item, int? quantity, int? price}) =>
      ItemDBData(
        id: id ?? this.id,
        item: item ?? this.item,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('ItemDBData(')
          ..write('id: $id, ')
          ..write('item: $item, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, item, quantity, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemDBData &&
          other.id == this.id &&
          other.item == this.item &&
          other.quantity == this.quantity &&
          other.price == this.price);
}

class ItemDBCompanion extends UpdateCompanion<ItemDBData> {
  final Value<int> id;
  final Value<String> item;
  final Value<int> quantity;
  final Value<int> price;
  const ItemDBCompanion({
    this.id = const Value.absent(),
    this.item = const Value.absent(),
    this.quantity = const Value.absent(),
    this.price = const Value.absent(),
  });
  ItemDBCompanion.insert({
    this.id = const Value.absent(),
    required String item,
    required int quantity,
    required int price,
  })  : item = Value(item),
        quantity = Value(quantity),
        price = Value(price);
  static Insertable<ItemDBData> custom({
    Expression<int>? id,
    Expression<String>? item,
    Expression<int>? quantity,
    Expression<int>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (item != null) 'item': item,
      if (quantity != null) 'quantity': quantity,
      if (price != null) 'price': price,
    });
  }

  ItemDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? item,
      Value<int>? quantity,
      Value<int>? price}) {
    return ItemDBCompanion(
      id: id ?? this.id,
      item: item ?? this.item,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (item.present) {
      map['item'] = Variable<String>(item.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemDBCompanion(')
          ..write('id: $id, ')
          ..write('item: $item, ')
          ..write('quantity: $quantity, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ItemDBTable itemDB = $ItemDBTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [itemDB];
}
