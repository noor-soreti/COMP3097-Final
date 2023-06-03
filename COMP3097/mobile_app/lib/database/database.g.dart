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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<String> price = GeneratedColumn<String>(
      'price', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, item, price];
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
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price'])!,
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
  final String price;
  const ItemDBData({required this.id, required this.item, required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item'] = Variable<String>(item);
    map['price'] = Variable<String>(price);
    return map;
  }

  ItemDBCompanion toCompanion(bool nullToAbsent) {
    return ItemDBCompanion(
      id: Value(id),
      item: Value(item),
      price: Value(price),
    );
  }

  factory ItemDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemDBData(
      id: serializer.fromJson<int>(json['id']),
      item: serializer.fromJson<String>(json['item']),
      price: serializer.fromJson<String>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'item': serializer.toJson<String>(item),
      'price': serializer.toJson<String>(price),
    };
  }

  ItemDBData copyWith({int? id, String? item, String? price}) => ItemDBData(
        id: id ?? this.id,
        item: item ?? this.item,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('ItemDBData(')
          ..write('id: $id, ')
          ..write('item: $item, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, item, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemDBData &&
          other.id == this.id &&
          other.item == this.item &&
          other.price == this.price);
}

class ItemDBCompanion extends UpdateCompanion<ItemDBData> {
  final Value<int> id;
  final Value<String> item;
  final Value<String> price;
  const ItemDBCompanion({
    this.id = const Value.absent(),
    this.item = const Value.absent(),
    this.price = const Value.absent(),
  });
  ItemDBCompanion.insert({
    this.id = const Value.absent(),
    required String item,
    required String price,
  })  : item = Value(item),
        price = Value(price);
  static Insertable<ItemDBData> custom({
    Expression<int>? id,
    Expression<String>? item,
    Expression<String>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (item != null) 'item': item,
      if (price != null) 'price': price,
    });
  }

  ItemDBCompanion copyWith(
      {Value<int>? id, Value<String>? item, Value<String>? price}) {
    return ItemDBCompanion(
      id: id ?? this.id,
      item: item ?? this.item,
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
    if (price.present) {
      map['price'] = Variable<String>(price.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemDBCompanion(')
          ..write('id: $id, ')
          ..write('item: $item, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }
}

class $ShoppingCartTable extends ShoppingCart
    with TableInfo<$ShoppingCartTable, ShoppingCartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingCartTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? 'shopping_cart';
  @override
  String get actualTableName => 'shopping_cart';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingCartData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingCartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingCartData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $ShoppingCartTable createAlias(String alias) {
    return $ShoppingCartTable(attachedDatabase, alias);
  }
}

class ShoppingCartData extends DataClass
    implements Insertable<ShoppingCartData> {
  final int id;
  const ShoppingCartData({required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    return map;
  }

  ShoppingCartCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartCompanion(
      id: Value(id),
    );
  }

  factory ShoppingCartData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartData(
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
    };
  }

  ShoppingCartData copyWith({int? id}) => ShoppingCartData(
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartData(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => id.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartData && other.id == this.id);
}

class ShoppingCartCompanion extends UpdateCompanion<ShoppingCartData> {
  final Value<int> id;
  const ShoppingCartCompanion({
    this.id = const Value.absent(),
  });
  ShoppingCartCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<ShoppingCartData> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  ShoppingCartCompanion copyWith({Value<int>? id}) {
    return ShoppingCartCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class $ShoppingCartEntriesTable extends ShoppingCartEntries
    with TableInfo<$ShoppingCartEntriesTable, ShoppingCartEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingCartEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userShoppingCartMeta =
      const VerificationMeta('userShoppingCart');
  @override
  late final GeneratedColumn<int> userShoppingCart = GeneratedColumn<int>(
      'user_shopping_cart', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES shopping_cart (id)'));
  static const VerificationMeta _itemMeta = const VerificationMeta('item');
  @override
  late final GeneratedColumn<int> item = GeneratedColumn<int>(
      'item', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateTimeAddedMeta =
      const VerificationMeta('dateTimeAdded');
  @override
  late final GeneratedColumn<DateTime> dateTimeAdded =
      GeneratedColumn<DateTime>('date_time_added', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userShoppingCart, item, dateTimeAdded];
  @override
  String get aliasedName => _alias ?? 'shopping_cart_entries';
  @override
  String get actualTableName => 'shopping_cart_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ShoppingCartEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_shopping_cart')) {
      context.handle(
          _userShoppingCartMeta,
          userShoppingCart.isAcceptableOrUnknown(
              data['user_shopping_cart']!, _userShoppingCartMeta));
    } else if (isInserting) {
      context.missing(_userShoppingCartMeta);
    }
    if (data.containsKey('item')) {
      context.handle(
          _itemMeta, item.isAcceptableOrUnknown(data['item']!, _itemMeta));
    } else if (isInserting) {
      context.missing(_itemMeta);
    }
    if (data.containsKey('date_time_added')) {
      context.handle(
          _dateTimeAddedMeta,
          dateTimeAdded.isAcceptableOrUnknown(
              data['date_time_added']!, _dateTimeAddedMeta));
    } else if (isInserting) {
      context.missing(_dateTimeAddedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ShoppingCartEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingCartEntry(
      userShoppingCart: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}user_shopping_cart'])!,
      item: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item'])!,
      dateTimeAdded: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_added'])!,
    );
  }

  @override
  $ShoppingCartEntriesTable createAlias(String alias) {
    return $ShoppingCartEntriesTable(attachedDatabase, alias);
  }
}

class ShoppingCartEntry extends DataClass
    implements Insertable<ShoppingCartEntry> {
  final int userShoppingCart;
  final int item;
  final DateTime dateTimeAdded;
  const ShoppingCartEntry(
      {required this.userShoppingCart,
      required this.item,
      required this.dateTimeAdded});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_shopping_cart'] = Variable<int>(userShoppingCart);
    map['item'] = Variable<int>(item);
    map['date_time_added'] = Variable<DateTime>(dateTimeAdded);
    return map;
  }

  ShoppingCartEntriesCompanion toCompanion(bool nullToAbsent) {
    return ShoppingCartEntriesCompanion(
      userShoppingCart: Value(userShoppingCart),
      item: Value(item),
      dateTimeAdded: Value(dateTimeAdded),
    );
  }

  factory ShoppingCartEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingCartEntry(
      userShoppingCart: serializer.fromJson<int>(json['userShoppingCart']),
      item: serializer.fromJson<int>(json['item']),
      dateTimeAdded: serializer.fromJson<DateTime>(json['dateTimeAdded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userShoppingCart': serializer.toJson<int>(userShoppingCart),
      'item': serializer.toJson<int>(item),
      'dateTimeAdded': serializer.toJson<DateTime>(dateTimeAdded),
    };
  }

  ShoppingCartEntry copyWith(
          {int? userShoppingCart, int? item, DateTime? dateTimeAdded}) =>
      ShoppingCartEntry(
        userShoppingCart: userShoppingCart ?? this.userShoppingCart,
        item: item ?? this.item,
        dateTimeAdded: dateTimeAdded ?? this.dateTimeAdded,
      );
  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntry(')
          ..write('userShoppingCart: $userShoppingCart, ')
          ..write('item: $item, ')
          ..write('dateTimeAdded: $dateTimeAdded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userShoppingCart, item, dateTimeAdded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingCartEntry &&
          other.userShoppingCart == this.userShoppingCart &&
          other.item == this.item &&
          other.dateTimeAdded == this.dateTimeAdded);
}

class ShoppingCartEntriesCompanion extends UpdateCompanion<ShoppingCartEntry> {
  final Value<int> userShoppingCart;
  final Value<int> item;
  final Value<DateTime> dateTimeAdded;
  final Value<int> rowid;
  const ShoppingCartEntriesCompanion({
    this.userShoppingCart = const Value.absent(),
    this.item = const Value.absent(),
    this.dateTimeAdded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShoppingCartEntriesCompanion.insert({
    required int userShoppingCart,
    required int item,
    required DateTime dateTimeAdded,
    this.rowid = const Value.absent(),
  })  : userShoppingCart = Value(userShoppingCart),
        item = Value(item),
        dateTimeAdded = Value(dateTimeAdded);
  static Insertable<ShoppingCartEntry> custom({
    Expression<int>? userShoppingCart,
    Expression<int>? item,
    Expression<DateTime>? dateTimeAdded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userShoppingCart != null) 'user_shopping_cart': userShoppingCart,
      if (item != null) 'item': item,
      if (dateTimeAdded != null) 'date_time_added': dateTimeAdded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShoppingCartEntriesCompanion copyWith(
      {Value<int>? userShoppingCart,
      Value<int>? item,
      Value<DateTime>? dateTimeAdded,
      Value<int>? rowid}) {
    return ShoppingCartEntriesCompanion(
      userShoppingCart: userShoppingCart ?? this.userShoppingCart,
      item: item ?? this.item,
      dateTimeAdded: dateTimeAdded ?? this.dateTimeAdded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userShoppingCart.present) {
      map['user_shopping_cart'] = Variable<int>(userShoppingCart.value);
    }
    if (item.present) {
      map['item'] = Variable<int>(item.value);
    }
    if (dateTimeAdded.present) {
      map['date_time_added'] = Variable<DateTime>(dateTimeAdded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingCartEntriesCompanion(')
          ..write('userShoppingCart: $userShoppingCart, ')
          ..write('item: $item, ')
          ..write('dateTimeAdded: $dateTimeAdded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $ItemDBTable itemDB = $ItemDBTable(this);
  late final $ShoppingCartTable shoppingCart = $ShoppingCartTable(this);
  late final $ShoppingCartEntriesTable shoppingCartEntries =
      $ShoppingCartEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [itemDB, shoppingCart, shoppingCartEntries];
}
