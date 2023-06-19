// To parse this JSON data, do
//
//     final meal = mealFromJson(jsonString);

import 'dart:convert';

List<Meal> mealFromJson(String str) {
  final jsonData = json.decode(str)['data'].cast<Map<String, dynamic>>();
  print("jsonData: +$jsonData");
  return jsonData.map<Meal>((json) => Meal.fromJson(json)).toList();
}

String mealToJson(List<Meal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Meal {
  String id;
  String name;
  int difficulty;
  int cookingTime;
  String calories;
  String imageUrl;

  Meal({
    required this.id,
    required this.name,
    required this.difficulty,
    required this.cookingTime,
    required this.calories,
    required this.imageUrl,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["id"],
        name: json["name"],
        difficulty: json["difficulty"],
        cookingTime: json["cookingTime"],
        calories: json["calories"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "difficulty": difficulty,
        "cookingTime": cookingTime,
        "calories": calories,
        "imageUrl": imageUrl,
      };
}
