// To parse this JSON data, do
//
//     final tag = tagFromJson(jsonString);

import 'dart:convert';

List<Tag> tagFromJson(String str) {
//  List<Tag>.from(json.decode(str).map((x) => Tag.fromJson(x)));

  final jsonData = json.decode(str)['data'].cast<Map<String, dynamic>>();
  print("jsonData: +$jsonData");
  return jsonData.map<Tag>((json) => Tag.fromJson(json)).toList();
}

String tagToJson(List<Tag> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tag {
  String id;
  String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
