// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UserDBTable extends UserDB with TableInfo<$UserDBTable, user> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, password, email, firstName, lastName];
  @override
  String get aliasedName => _alias ?? 'user_d_b';
  @override
  String get actualTableName => 'user_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<user> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  user map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return user(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name'])!,
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
    );
  }

  @override
  $UserDBTable createAlias(String alias) {
    return $UserDBTable(attachedDatabase, alias);
  }
}

class user extends DataClass implements Insertable<user> {
  final int id;
  final String username;
  final String password;
  final String email;
  final String firstName;
  final String lastName;
  const user(
      {required this.id,
      required this.username,
      required this.password,
      required this.email,
      required this.firstName,
      required this.lastName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    map['email'] = Variable<String>(email);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    return map;
  }

  UserDBCompanion toCompanion(bool nullToAbsent) {
    return UserDBCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      email: Value(email),
      firstName: Value(firstName),
      lastName: Value(lastName),
    );
  }

  factory user.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return user(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      email: serializer.fromJson<String>(json['email']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'email': serializer.toJson<String>(email),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
    };
  }

  user copyWith(
          {int? id,
          String? username,
          String? password,
          String? email,
          String? firstName,
          String? lastName}) =>
      user(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
  @override
  String toString() {
    return (StringBuffer('user(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, username, password, email, firstName, lastName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is user &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.email == this.email &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName);
}

class UserDBCompanion extends UpdateCompanion<user> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String> email;
  final Value<String> firstName;
  final Value<String> lastName;
  const UserDBCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.email = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
  });
  UserDBCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    required String email,
    required String firstName,
    required String lastName,
  })  : username = Value(username),
        password = Value(password),
        email = Value(email),
        firstName = Value(firstName),
        lastName = Value(lastName);
  static Insertable<user> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? email,
    Expression<String>? firstName,
    Expression<String>? lastName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (email != null) 'email': email,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
    });
  }

  UserDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? password,
      Value<String>? email,
      Value<String>? firstName,
      Value<String>? lastName}) {
    return UserDBCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDBCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('email: $email, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName')
          ..write(')'))
        .toString();
  }
}

class $ProductDBTable extends ProductDB
    with TableInfo<$ProductDBTable, product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductDBTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, description, price];
  @override
  String get aliasedName => _alias ?? 'product_d_b';
  @override
  String get actualTableName => 'product_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return product(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
    );
  }

  @override
  $ProductDBTable createAlias(String alias) {
    return $ProductDBTable(attachedDatabase, alias);
  }
}

class product extends DataClass implements Insertable<product> {
  final int id;
  final String name;
  final String description;
  final double price;
  const product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['price'] = Variable<double>(price);
    return map;
  }

  ProductDBCompanion toCompanion(bool nullToAbsent) {
    return ProductDBCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      price: Value(price),
    );
  }

  factory product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return product(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<double>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<double>(price),
    };
  }

  product copyWith(
          {int? id, String? name, String? description, double? price}) =>
      product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('product(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is product &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price);
}

class ProductDBCompanion extends UpdateCompanion<product> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<double> price;
  final Value<int> rowid;
  const ProductDBCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductDBCompanion.insert({
    required int id,
    required String name,
    required String description,
    required double price,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        price = Value(price);
  static Insertable<product> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<double>? price,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<double>? price,
      Value<int>? rowid}) {
    return ProductDBCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductDBCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

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
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
      'item_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
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
  List<GeneratedColumn> get $columns => [id, itemId, item, price];
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
    if (data.containsKey('item_id')) {
      context.handle(_itemIdMeta,
          itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta));
    } else if (isInserting) {
      context.missing(_itemIdMeta);
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
      itemId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_id'])!,
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
  final int itemId;
  final String item;
  final String price;
  const ItemDBData(
      {required this.id,
      required this.itemId,
      required this.item,
      required this.price});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['item_id'] = Variable<int>(itemId);
    map['item'] = Variable<String>(item);
    map['price'] = Variable<String>(price);
    return map;
  }

  ItemDBCompanion toCompanion(bool nullToAbsent) {
    return ItemDBCompanion(
      id: Value(id),
      itemId: Value(itemId),
      item: Value(item),
      price: Value(price),
    );
  }

  factory ItemDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemDBData(
      id: serializer.fromJson<int>(json['id']),
      itemId: serializer.fromJson<int>(json['itemId']),
      item: serializer.fromJson<String>(json['item']),
      price: serializer.fromJson<String>(json['price']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'itemId': serializer.toJson<int>(itemId),
      'item': serializer.toJson<String>(item),
      'price': serializer.toJson<String>(price),
    };
  }

  ItemDBData copyWith({int? id, int? itemId, String? item, String? price}) =>
      ItemDBData(
        id: id ?? this.id,
        itemId: itemId ?? this.itemId,
        item: item ?? this.item,
        price: price ?? this.price,
      );
  @override
  String toString() {
    return (StringBuffer('ItemDBData(')
          ..write('id: $id, ')
          ..write('itemId: $itemId, ')
          ..write('item: $item, ')
          ..write('price: $price')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, itemId, item, price);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemDBData &&
          other.id == this.id &&
          other.itemId == this.itemId &&
          other.item == this.item &&
          other.price == this.price);
}

class ItemDBCompanion extends UpdateCompanion<ItemDBData> {
  final Value<int> id;
  final Value<int> itemId;
  final Value<String> item;
  final Value<String> price;
  const ItemDBCompanion({
    this.id = const Value.absent(),
    this.itemId = const Value.absent(),
    this.item = const Value.absent(),
    this.price = const Value.absent(),
  });
  ItemDBCompanion.insert({
    this.id = const Value.absent(),
    required int itemId,
    required String item,
    required String price,
  })  : itemId = Value(itemId),
        item = Value(item),
        price = Value(price);
  static Insertable<ItemDBData> custom({
    Expression<int>? id,
    Expression<int>? itemId,
    Expression<String>? item,
    Expression<String>? price,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (itemId != null) 'item_id': itemId,
      if (item != null) 'item': item,
      if (price != null) 'price': price,
    });
  }

  ItemDBCompanion copyWith(
      {Value<int>? id,
      Value<int>? itemId,
      Value<String>? item,
      Value<String>? price}) {
    return ItemDBCompanion(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
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
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
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
          ..write('itemId: $itemId, ')
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
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES item_d_b (id)'));
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
  late final $UserDBTable userDB = $UserDBTable(this);
  late final $ProductDBTable productDB = $ProductDBTable(this);
  late final $ItemDBTable itemDB = $ItemDBTable(this);
  late final $ShoppingCartTable shoppingCart = $ShoppingCartTable(this);
  late final $ShoppingCartEntriesTable shoppingCartEntries =
      $ShoppingCartEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userDB, productDB, itemDB, shoppingCart, shoppingCartEntries];
}
