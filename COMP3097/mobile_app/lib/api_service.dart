import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> testService(int id) async {
  var response = await http.get(Uri.parse(
      "https://api.spoonacular.com/food/ingredients/$id/information?amount=1&apiKey=37179a8a4be04ec1bb0c58c031755f7c"));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load service');
  }

  // final response = Uri(
  //     scheme: 'https',
  //     host: dotenv.env['BASE_URL'],
  //     path: dotenv.env['ingredients/search?query=banana'],
  //     queryParameters: {'apiKey': dotenv.env['API_KEY']});
}
