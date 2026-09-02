import 'dart:ffi';

class TokenResponseModel {
  final String accessToken;
  final int expiresIn;
  final String tokenType;
  final String scope;

  const TokenResponseModel({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
    required this.scope,
  });

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) {
    return TokenResponseModel(
      accessToken: json['access_token'] ?? "",
      expiresIn: json['expires_in'] ?? 0,
      tokenType: json['token_type'] ?? "",
      scope: json['scope'] ?? "",
    );
  }
}
