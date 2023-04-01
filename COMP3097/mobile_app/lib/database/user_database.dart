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
      ${UserFields.password} TEXT NOT NULL,
      ${UserFields.firstname} TEXT NOT NULL,
      ${UserFields.lastname} TEXT NOT NULL,
      ${UserFields.email} TEXT NOT NULL)
      ''');
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

  Future<User> createUser(User user) async {
    final db = await instance.database; // get connection to database
    await db!.insert(usertable, user.toMap());
    return user;
  }

  Future<User> getUser(String username) async {
    final db = await instance.database;
    final maps = await db!.query(usertable,
        columns: UserFields.allFields,
        where: '${UserFields.username} = ?',
        whereArgs: [username]);
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    } else {
      throw Exception("$username not found");
    }
  }

  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db!.query(usertable);
    return result.map((e) => User.fromMap(e)).toList();
  }

  Future<int> updateUser(User user) async {
    final db = await instance.database;
    return db!.update(usertable, user.toMap(),
        where: '${UserFields.username} = ?', whereArgs: [user.username]);
  }

  Future<int> deleteUser(String username) async {
    final db = await instance.database;
    return db!.delete(usertable,
        where: '${UserFields.username} = ?', whereArgs: [username]);
  }

  Future<ShoppingList> createShoppingList(ShoppingList shoppingList) async {
    final db = await instance.database;
    await db!.insert(listTable, shoppingList.toMap());
    return shoppingList;
  }

  Future<List<ShoppingList>> getShoppingList(String username) async {
    final db = await instance.database;
    final results = await db!.query(listTable,
        where: '${ShoppingListFields.username} = ?', whereArgs: [username]);
    return results.map((e) => ShoppingList.fromMap((e))).toList();
  }

  Future<int> deleteShoppingList(ShoppingList shoppingList) async {
    final db = await instance.database;
    return db!.delete(listTable,
        where:
            "${ShoppingListFields.username} = ? and ${ShoppingListFields.title} = ?",
        whereArgs: [shoppingList.username, shoppingList.title]);
  }
}
