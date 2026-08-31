import 'dart:convert';

import 'package:OWILC/api/base_url/end_points.dart';
import 'package:OWILC/features/authentication/model/login_request_model.dart';
import 'package:OWILC/features/authentication/model/login_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  ///=================================
  /// get response fro login api
  /// ================================
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    final response = await http.post(
      Uri.parse(EndPoints.login),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    final data = jsonDecode(response.body);
    return LoginResponseModel.fromJson(data);
  }
}
