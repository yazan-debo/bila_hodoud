import 'dart:convert';

class UserModel {
  String? message;
  String? token;
  int? userId;

  UserModel({
    this.message,
    this.token,
    this.userId,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        token: json["token"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "user_id": userId,
      };
}
