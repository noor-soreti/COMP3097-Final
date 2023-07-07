import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/main.dart';

class UserService {
  final db = FirebaseFirestore.instance;
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

  Future addData() async {
    // Create a new user with a first and last name
// Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future readData() async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  // void insertProduct() async {
  //   var t = await database.getAllProducts();
  //   for (var i in t) {
  //     var product = <String, dynamic>{
  //       'id': i.id,
  //       'name': i.name,
  //       'price': i.price
  //     };
  //     db.collection('product').add(product).then((DocumentReference doc) =>
  //         print('DocumentSnapshot added with ID: ${doc.id}'));
  //   }
  // }
}
