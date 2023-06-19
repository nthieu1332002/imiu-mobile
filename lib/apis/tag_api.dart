import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imiu_mobile/models/tag.dart';

class TagApi {
  static var client = http.Client();

  static Future<List<Tag>> getTags() async {
    final baseUrl = dotenv.env['API_ENDPOINT'];
    final uri = Uri.parse('$baseUrl/tags');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      var jsonString = response.body;
      return tagFromJson(jsonString);
    } else {
      //error
      throw Exception('Failed to get tags');
    }
  }
}
