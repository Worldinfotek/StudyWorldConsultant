class LoginResponseModel {
  /// variables
  final int result;
  final String description;

  /// constructor
  LoginResponseModel({required this.result, required this.description});

  /// copy with constructor
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      result: json['result'] ?? 0,
      description: json['description'] ?? "",
    );
  }

  bool get isSuccess => result == 1;
}
