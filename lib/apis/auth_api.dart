import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthApi {
  static var client = http.Client();

  Future<http.Response> _sendRequest(
      {required String url, String method = 'GET', Object? body}) async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final baseUrl = dotenv.env['API_ENDPOINT'];
    final uri = Uri.parse('$baseUrl/auth$url');
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

  Future<http.Response> login(Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/login", method: 'POST', body: data);
    return response;
  }

  Future<http.Response> loginWithGoogle(Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/google-login", method: 'POST', body: data);
    return response;
  }

  Future<http.Response> verify(String token) async {
    final response = await _sendRequest(url: "/verify-email?token=$token");
    return response;
  }

  Future<http.Response> email(Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/email", method: 'POST', body: data);
    return response;
  }

  Future<http.Response> register(Map<String, dynamic> data) async {
    final response =
        await _sendRequest(url: "/register", method: 'POST', body: data);
    return response;
  }
}
