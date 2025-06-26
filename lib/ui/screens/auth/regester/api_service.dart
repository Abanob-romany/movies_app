import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://route-movie-apis.vercel.app/auth';

  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required int avaterId, // Updated to match API example (typo preserved)
  }) async {
    try {
      final payload = {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword, // Updated to match API example
        'phone': phone,
        'avaterId': avaterId, // Updated to match API example
      };
      print('Register Payload: $payload');
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      );
      print('Register Response: ${response.statusCode} - ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        throw Exception(
            'Bad request: ${jsonDecode(response.body)['message'] ?? 'Invalid data'}');
      } else {
        throw Exception(
            'Failed to register: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Register Error: $e');
      throw Exception('Error during registration: $e');
    }
  }

  static Future<Map<String, dynamic>> login(
      String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
      );
      print('Login Response: ${response.statusCode} - ${response.body}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to login: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Login Error: $e');
      throw Exception('Error during login: $e');
    }
  }
}
