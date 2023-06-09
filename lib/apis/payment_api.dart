import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentApi {
  static var client = http.Client();

  static Future<Map<String, dynamic>> _sendRequest(
      {required String url, String method = 'GET', Object? body}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final baseUrl = dotenv.env['API_ENDPOINT'];
    final uri = Uri.parse('$baseUrl/payments$url');
    try {
      final response = await client.send(http.Request(method, uri)
        ..headers.addAll(headers)
        ..body = jsonEncode(body));
      final responseString = await response.stream
          .bytesToString(); // convert response stream to string
      final responseJson = jsonDecode(responseString)
          as Map<String, dynamic>; // parse JSON string to Map
      return responseJson;
    } catch (e) {
      print('Error in AuthApi: $e');
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getQrCode(
      Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/qr-code", method: 'POST', body: data);
    return response;
  }

  static Future<Map<String, dynamic>> plans(Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/plans", method: 'POST', body: data);
    return response;
  }
}
