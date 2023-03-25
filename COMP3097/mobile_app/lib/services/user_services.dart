import 'package:mongo_dart/mongo_dart.dart' show Db, DbCollection;
import 'package:mobile_app/models/user_model.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void start() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      openDatabase(join(await getDatabasesPath(), 'user_database.db'),
          onCreate: (db, version) {
    return db.execute(
      'CREATE TABLE user(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, email TEXT)',
    );
  }, version: 1);

  // insert user to db
  Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // retrieve all users from db
  Future<List<User>> users() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    return List.generate(maps.length, (index) {
      return User.all(
          id: maps[index]['id'],
          firstname: maps[index]['firstname'],
          lastname: maps[index]['lastname'],
          email: maps[index]['email']);
    });
  }

  Future<void> updateUser(User user) async {
    final db = await database;
    await db
        .update('user', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete('user', where: 'id = ?', whereArgs: [id]);
  }

  // dummy data
  var fakeUser = User.withoutId("Noor", "Said", "email@email.com");
  insertUser(fakeUser);
}
