import 'dart:convert';
import 'package:archive_app2/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class AuthService {
  final box = GetStorage();

  // Login işlemi
  Future<AuthModel?> login(
      String email, String password, BuildContext context) async {
    String? serverUrl = box.read('serverUrl') ?? '';
    final String baseUrl = '$serverUrl/backend/api/auth';

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userNameOrEmail': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      // Token'ı SharedPreferences içine kaydet
      String token = result['data']['accessToken'] ?? '';

      if (token.isNotEmpty) {
        await TokenManager.saveToken(token); // Token'ı kaydet
      }

      // AuthModel nesnesini döndür
      return AuthModel.fromJson(result);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
      return null;
    }
  }
}

// Token Yönetimi için TokenManager
class TokenManager {
  static final GetStorage _storage = GetStorage();

  static Future<void> saveToken(String token) async {
    await _storage.write('token', token);
  }

  static Future<String?> getToken() async {
    return _storage.read('token');
  }

  static Future<void> clearToken() async {
    await _storage.remove('token');
  }
}
