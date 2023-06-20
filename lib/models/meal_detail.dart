// To parse this JSON data, do
//
//     final mealDetail = mealDetailFromJson(jsonString);

import 'dart:convert';

MealDetail mealDetailFromJson(String str) {
  final jsonData = json.decode(str)['data'];
  print("jsonData: +$jsonData");
  return MealDetail.fromJson(jsonData);
}

// MealDetail mealDetailFromJson(String str) => MealDetail.fromJson(json.decode(str));

String mealDetailToJson(MealDetail data) => json.encode(data.toJson());

class MealDetail {
  String id;
  String name;
  String summary;
  int cookingTime;
  int difficulty;
  String imageUrl;
  List<NutritionFact> nutritionFacts;
  List<MealTag> mealTags;
  List<Direction> directions;
  List<MealIngredient> mealIngredients;

  MealDetail({
    required this.id,
    required this.name,
    required this.summary,
    required this.cookingTime,
    required this.difficulty,
    required this.imageUrl,
    required this.nutritionFacts,
    required this.mealTags,
    required this.directions,
    required this.mealIngredients,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) => MealDetail(
        id: json["id"],
        name: json["name"],
        summary: json["summary"],
        cookingTime: json["cookingTime"],
        difficulty: json["difficulty"],
        imageUrl: json["imageUrl"],
        nutritionFacts: List<NutritionFact>.from(
            json["nutritionFacts"].map((x) => NutritionFact.fromJson(x))),
        mealTags: List<MealTag>.from(
            json["mealTags"].map((x) => MealTag.fromJson(x))),
        directions: List<Direction>.from(
            json["directions"].map((x) => Direction.fromJson(x))),
        mealIngredients: List<MealIngredient>.from(
            json["mealIngredients"].map((x) => MealIngredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "summary": summary,
        "cookingTime": cookingTime,
        "difficulty": difficulty,
        "imageUrl": imageUrl,
        "nutritionFacts":
            List<dynamic>.from(nutritionFacts.map((x) => x.toJson())),
        "mealTags": List<dynamic>.from(mealTags.map((x) => x.toJson())),
        "directions": List<dynamic>.from(directions.map((x) => x.toJson())),
        "mealIngredients":
            List<dynamic>.from(mealIngredients.map((x) => x.toJson())),
      };
}

class Direction {
  String id;
  int stepNumber;
  String instruction;
  String imgUrl;

  Direction({
    required this.id,
    required this.stepNumber,
    required this.instruction,
    required this.imgUrl,
  });

  factory Direction.fromJson(Map<String, dynamic> json) => Direction(
        id: json["id"],
        stepNumber: json["stepNumber"],
        instruction: json["instruction"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stepNumber": stepNumber,
        "instruction": instruction,
        "imgUrl": imgUrl,
      };
}

class MealIngredient {
  String id;
  String name;
  String unit;
  num quantity;
  String description;
  String imgUrl;

  MealIngredient({
    required this.id,
    required this.name,
    required this.unit,
    required this.quantity,
    required this.description,
    required this.imgUrl,
  });

  factory MealIngredient.fromJson(Map<String, dynamic> json) => MealIngredient(
        id: json["id"],
        name: json["name"],
        unit: json["unit"],
        quantity: json["quantity"],
        description: json["description"],
        imgUrl: json["imgUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "unit": unit,
        "quantity": quantity,
        "description": description,
        "imgUrl": imgUrl,
      };
}

class MealTag {
  String id;
  String name;
  String code;

  MealTag({
    required this.id,
    required this.name,
    required this.code,
  });

  factory MealTag.fromJson(Map<String, dynamic> json) => MealTag(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}

class NutritionFact {
  String id;
  String nutritionId;
  String name;
  num value;
  String code;

  NutritionFact({
    required this.id,
    required this.nutritionId,
    required this.name,
    required this.value,
    required this.code,
  });

  factory NutritionFact.fromJson(Map<String, dynamic> json) => NutritionFact(
        id: json["id"],
        nutritionId: json["nutritionId"],
        name: json["name"],
        value: json["value"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nutritionId": nutritionId,
        "name": name,
        "value": value,
        "code": code,
      };
}
