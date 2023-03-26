import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/user_model.dart';

class SqliteDatabaseHelper {
  final String _tableName = "users";

  Future<Database> getDataBase() async {
    return openDatabase(
      join(await getDatabasesPath(), "usersDatabase.db"),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $_tableName (id INT PRIMARY KEY, username TEXT, password TEXT, firstname TEXT, lastname TEXT, email TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertUser(User user) async {
    int userId = 0;
    Database db = await getDataBase();
    await db.insert(_tableName, user.toMap()).then((value) {
      userId = value;
    });
    return userId;
  }

  Future<List<User>> getAllUsers() async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> usersMap = await db.query(_tableName);
    return List.generate(usersMap.length, (index) {
      return User.required(
        id: usersMap[index]["id"],
        username: usersMap[index]["username"],
        password: usersMap[index]["password"],
        email: usersMap[index]["email"],
        firstname: usersMap[index]["firstname"],
        lastname: usersMap[index]["lastname"],
      );
    });
  }

  Future<User> getUser(String userId) async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> user =
        await db.rawQuery("SELECT * FROM $_tableName WHERE id = $userId");
    if (user.length == 1) {
      return User.required(
        id: user[0]["id"],
        username: user[0]["username"],
        password: user[0]["password"],
        email: user[0]["email"],
        firstname: user[0]["firstname"],
        lastname: user[0]["lastname"],
      );
    } else {
      return User();
    }
  }

  Future<void> updateUser(int id, String username, String firstname,
      String lastname, String password, String email) async {
    Database db = await getDataBase();
    db.rawUpdate(
        "UPDATE $_tableName SET username = '$username', password = '$password', firstname = '$firstname', lastname = '$lastname', email = '$email' WHERE id = '$id'");
  }

  Future<void> deleteUser(String userId) async {
    Database db = await getDataBase();
    await db.rawDelete(
      "DELETE FROM $_tableName WHERE id = '$userId'");
  }
}
