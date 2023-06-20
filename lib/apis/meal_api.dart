import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imiu_mobile/models/meal.dart';
import 'package:imiu_mobile/models/meal_detail.dart';

class MealApi {
  static var client = http.Client();

  static Future<List<Meal>> getMealList() async {
    final baseUrl = dotenv.env['API_ENDPOINT'];
    final uri = Uri.parse('$baseUrl/meals?pageNumber=1&pageSize=4');
    final response = await client.get(uri).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var jsonString = response.body;
      return mealFromJson(jsonString);
    } else {
      //error
      throw Exception('Failed to get meals');
    }
  }

  static Future<MealDetail> getMealDetail(String id) async {
    final baseUrl = dotenv.env['API_ENDPOINT'];
    final uri = Uri.parse('$baseUrl/meals/$id');
    print(uri);
    final response = await client.get(uri).timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var jsonString = response.body;
      return mealDetailFromJson(jsonString);
    } else {
      //error
      throw Exception('Failed to get meals');
    }
  }
}
