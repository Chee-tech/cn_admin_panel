// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.refreshToken,
    required this.email,
    required this.userId,
    required this.googleUid,
    required this.userType,
    required this.refreshTokenExpiryTime,
  });

  String token;
  String refreshToken;
  String email;
  String userId;
  String googleUid;
  String userType;
  DateTime refreshTokenExpiryTime;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
          token: json["token"],
          refreshToken: json["refreshToken"],
          email: json["email"],
          userId: json["userId"],
          googleUid: json["googleUid"],
          userType: json["userType"],
          refreshTokenExpiryTime:
              DateTime.parse(json["refreshTokenExpiryTime"]));

  Map<String, dynamic> toJson() => {
        "token": token,
        "refreshToken": refreshToken,
        "email": email,
        "userId": userId,
        "googleUid": googleUid,
        "userType": userType,
        "refreshTokenExpiryTime": refreshTokenExpiryTime.toIso8601String(),
      };
}

class Login {
  String email;
  String password;

  Login({required this.email, required this.password});

  Map<String, String> toJson() => {'email': email, 'password': password};
}
