import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/signup_model.dart';

class ApiService {
  static const String apiUrl = 'http://10.0.2.2:8000/auth/register/';

  static Future<void> signUp(SignUpModel model) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(model.toJson()),
      );

      if (response.statusCode == 200) {
        print("Sign-up successful: ${response.body}");
      } else {
        print("Error: ${response.body}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }
}
