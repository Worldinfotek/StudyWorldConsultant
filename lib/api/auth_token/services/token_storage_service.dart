import 'dart:convert';

import 'package:OWILC/api/auth_token/model/user_payload_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorageService {
  TokenStorageService._();

  static const String _tokenKey = "auth_token";
  static const String _userDataKey = "user_data";

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.getString(_tokenKey);
  }

  static Future<void> savePayload(UserPayloadModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, jsonEncode(user.toJson()));
  }

  static Future<UserPayloadModel?> getUserPayload() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs .getString(_userDataKey);
    if(userJson == null) return null;
    return UserPayloadModel.fromJson(jsonDecode(userJson));
  }

  static Future<void> saveSession({
    required String token,
    required UserPayloadModel user,
  })  async {
    await saveToken(token);
    await savePayload(user);
  }

  static Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userDataKey);
  }

  static Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }




}
