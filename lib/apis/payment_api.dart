import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentApi {
  static var client = http.Client();

  static Future<http.Response> _sendRequest(
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
      return http.Response.fromStream(response);
    } catch (e) {
      print('Error in AuthApi: $e');
      rethrow;
    }
  }

  static Future<http.Response> getQrCode(Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/qr-code", method: 'POST', body: data);
    return response;
  }

  static Future<http.Response> plans(Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/plans", method: 'POST', body: data);
    return response;
  }
}
