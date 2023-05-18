import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';

class TestDatabase {
  static final TestDatabase instance = TestDatabase._initialize();
  static Database? _database;
  TestDatabase._initialize();

  Future _createDb(Database db, int version) async {
    
  }

}
