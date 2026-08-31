class LoginRequestModel {
  /// variables
  final String userNameOrEmailAddress;
  final String password;
  final bool rememberMe;

  /// constructor
  LoginRequestModel({
    required this.userNameOrEmailAddress,
    required this.password,
    this.rememberMe = false,
  });

  /// json object
  Map<String, dynamic> toJson() => {
    "userNameOrEmailAddress": userNameOrEmailAddress,
    "password": password,
    "rememberMe": rememberMe,
  };
}
