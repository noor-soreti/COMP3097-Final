import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> productInfoApi(int id) async {
  var response = await http.get(Uri.parse(
      "https://api.spoonacular.com/food/ingredients/$id/information?amount=1&apiKey=b2de2effb6dd4e71b9ea35cf43c7aeaf"));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load service');
  }
}

Future<dynamic> aisleTest(int id) async {
  var response = await http.get(Uri.parse(
      "https://api.spoonacular.com/food/products/$id/&apiKey=37179a8a4be04ec1bb0c58c031755f7c"));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load service');
  }
}
