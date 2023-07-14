import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/src/models.dart';

class ProductService {
  final db = FirebaseFirestore.instance.collection('product');

  Future<Iterable<Product>> readData() async {
    return (await db.get()).docs.map((value) => Product.fromJSON(value.data()));
  }

  


}
