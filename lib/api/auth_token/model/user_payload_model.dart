class UserPayloadModel {
  final String userid;
  final String name;
  final String email;
  final List<String> role;

  const UserPayloadModel({
    required this.userid,
    required this.name,
    required this.email,
    required this.role,
  });

  factory UserPayloadModel.fromJson(Map<String, dynamic> json) {
    return UserPayloadModel(
      userid: json['sub'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      role: json['role'] != null ? List<String>.from(json['role']) : [],
    );
  }

  Map<String, dynamic> toJson() => {
    "sub": userid,
    "name": name,
    "email": email,
    "role": role,
  };
}
