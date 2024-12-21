import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';

  // Function to login and store token
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Decode the response body
      final Map<String, dynamic> data = json.decode(response.body);

      // Check if login is successful and store token
      if (data['success']) {
        // Store the token in shared preferences
        await storeToken(data['token']);
      }

      return data;
    } else {
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }

  // Function to store the token in shared preferences
  static Future<void> storeToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token); // Store token
  }

  // Function to get the stored token
  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token'); // Retrieve token
  }

  // Optional: Function to check if the user is logged in (if a token exists)
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  // Optional: Function to logout by clearing the token
  static Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token'); // Clear the stored token
  }
}
