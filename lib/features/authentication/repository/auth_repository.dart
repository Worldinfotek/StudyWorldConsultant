import 'dart:convert';

import 'package:OWILC/api/auth_token/model/token_response_model.dart';
import 'package:OWILC/api/auth_token/model/user_payload_model.dart';
import 'package:OWILC/api/auth_token/token_constants/token_constant.dart';
import 'package:OWILC/api/base_url/end_points.dart';
import 'package:OWILC/features/authentication/model/login_request_model.dart';
import 'package:OWILC/features/authentication/model/login_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

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

  ///=================================
  /// get token response
  /// ================================
  Future<TokenResponseModel> getToken({
    required String username,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse(EndPoints.authToken),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "username": username,
        "password": password,
        "grant_type": TokenConstant.grant_type,
        "client_id": TokenConstant.client_id,
        "scope": TokenConstant.scope,
      },
    );

    final data = jsonDecode(response.body);
    return TokenResponseModel.fromJson(data);
  }

  UserPayloadModel decodeToken(String accessToken) {
    final payload = JwtDecoder.decode(accessToken);
    return UserPayloadModel.fromJson(payload);
  }
}
