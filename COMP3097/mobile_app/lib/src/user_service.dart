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
        .firstWhere((element) => element.email == email);
  }

  Future readUserDataWithList(String email) async {
    return (await db.get())
        .docs
        .map((value) => User.fromJSONWithList(value.data()))
        .firstWhere((element) => element.email == email);
  }

  Future update(User user) async {
    late String id;
    await db.where("email", isEqualTo: user.email).get().then((value) => {
          for (var i in value.docs) {id = i.id}
        });

    return db.doc(id).set({
      "email": user.email,
      "firstname": user.firstname,
      "lastname": user.lastname,
      "product": user.product!.map((e) => e.toJSON()).toList()
    }, SetOptions(merge: true));
  }
}
