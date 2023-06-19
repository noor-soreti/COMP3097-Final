import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> productInfoApi(int id) async {
  var response = await http.get(Uri.parse(
      "https://api.spoonacular.com/food/ingredients/$id/information?amount=1&apiKey=db619c3581aa4df5a89cad80446e37fe"));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load service');
  }
}

Future<dynamic> aisleTest(int id) async {
  var response = await http.get(Uri.parse(
      "https://api.spoonacular.com/food/products/$id/&apiKey=db619c3581aa4df5a89cad80446e37fe"));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load service');
  }
}
