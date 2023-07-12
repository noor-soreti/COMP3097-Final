import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mobile_app/src/models.dart';

class UserService {
  final db = FirebaseFirestore.instance.collection('user');

  Future addUser(Map<String, dynamic> user) async {
    db.add(user);
  }

  Future<User> readUserData(String email) async {
    return (await db.get())
        .docs
        .map((value) => User.fromJSON(value.data()))
        .first;
  }
}
