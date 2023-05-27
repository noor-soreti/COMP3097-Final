import 'package:mobile_app/models/shopping_list_model.dart';
import 'package:mobile_app/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._initialize();
  static Database? _database;
  UserDatabase._initialize();

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE $usertable (
      ${UserFields.username} TEXT PRIMARY KEY NOT NULL,
      ${UserFields.password} TEXT NOT NULL)
      ''');
    // ${UserFields.firstname} TEXT NOT NULL,
    // ${UserFields.lastname} TEXT NOT NULL,
    // ${UserFields.email} TEXT NOT NULL)

    await db.execute('''CREATE TABLE $listTable (
        ${ItemFields.username} TEXT NOT NULL,
        ${ItemFields.name} TEXT NOT NULL,
        ${ItemFields.price} INT NOT NULL,
        ${ItemFields.quantity} INT NOT NULL,
        FOREIGN KEY (${ItemFields.username}) REFERENCES $usertable (${UserFields.username}))''');
  }

  Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<Database> _initDB(String filename) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filename);
    // await deleteDatabase(path);
    return await openDatabase(path,
        version: 1, onCreate: _createDB, onConfigure: _onConfigure);
  }

  Future close() async {
    final db = await instance.database;
    db!.close();
  }

  // getter for database
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDB('user.db');
      return _database;
    }
  }

  Future<UserModel> createUser(UserModel user) async {
    final db = await instance.database; // get connection to database
    await db!.insert(usertable, user.toMap());
    return user;
  }

  Future<UserModel> getUser(String username) async {
    final db = await instance.database;
    final maps = await db!.query(usertable,
        columns: UserFields.allFields,
        where: '${UserFields.username} = ?',
        whereArgs: [username]);
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception("$username not found");
    }
  }

  Future<UserModel> getUsernamePassword(
      String username, String password) async {
    final db = await instance.database;
    final maps = await db!.query(usertable,
        columns: UserFields.allFields,
        where: '${UserFields.username} = ? and ${UserFields.password} = ?',
        whereArgs: [username, password]);
    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception("$username not found");
    }
  }

  Future<List<UserModel>> getAllUsers() async {
    final db = await instance.database;
    final result = await db!.query(usertable);
    return result.map((e) => UserModel.fromMap(e)).toList();
  }

  Future<int> updateUser(UserModel user) async {
    final db = await instance.database;
    return db!.update(usertable, user.toMap(),
        where: '${UserFields.username} = ?', whereArgs: [user.username]);
  }

  Future<int> deleteUser(String username) async {
    final db = await instance.database;
    return db!.delete(usertable,
        where: '${UserFields.username} = ?', whereArgs: [username]);
  }

  // SHOPPING LIST

  Future<ShoppingList> createShoppingList(ShoppingList shoppingList) async {
    final db = await instance.database;
    var test = await getShoppingList(shoppingList.username);
    for (var i in test) {
      // check duplicate value
      if (shoppingList.name == i.name) {
        shoppingList.quantity = i.quantity + 1;
      }
    }
    print(shoppingList.quantity);
    await db!.insert(listTable, shoppingList.toMap());
    return shoppingList;
  }

  Future<List<ShoppingList>> getShoppingList(String username) async {
    final db = await instance.database;
    final results = await db!.query(listTable,
        where: '${ItemFields.username} = ?', whereArgs: [username]);

    return results.map((e) => ShoppingList.fromMap((e))).toList();
  }

  Future<List<double>> getPrice(String username) async {
    final db = await instance.database;
    final results = await db!.query(listTable,
        where: '${ItemFields.username} = ?', whereArgs: [username]);

    final t = results.map((e) => ShoppingList.fromMap((e))).toList();

    final List<double> priceList = [];
    for (var i in t) {
      priceList.add(i.price);
    }
    return priceList;
  }

  Future<int> deleteShoppingList(ShoppingList shoppingList) async {
    final db = await instance.database;
    return db!.delete(listTable,
        where: "${ItemFields.username} = ? and ${ItemFields.name} = ?",
        whereArgs: [shoppingList.username, shoppingList.name]);
  }
}
