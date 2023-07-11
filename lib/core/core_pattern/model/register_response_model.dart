// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) =>
    RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) =>
    json.encode(data.toJson());

class RegisterResponseModel {
  RegisterResponseModel({
    required this.id,
    required this.surName,
    required this.firstName,
    required this.email,
    required this.phoneNo,
    required this.sex,
    required this.address,
    required this.imagePath,
    required this.createdAt,
  });

  String id;
  String surName;
  String firstName;
  String email;
  String phoneNo;
  String sex;
  String address;
  String imagePath;

  DateTime createdAt;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        id: json["id"],
        surName: json["surName"],
        firstName: json["firstName"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        sex: json["sex"],
        address: json["address"],
        imagePath: json["imagePath"],
        // userType: json["userType"]??null,
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surName": surName,
        "firstName": firstName,
        "email": email,
        "phoneNo": phoneNo,
        "sex": sex,
        "address": address,
        "imagePath": imagePath,
        // "userType": userType,
        "createdAt": createdAt.toIso8601String(),
      };
}

class User {
  User({
    required this.id,
    required this.surName,
    required this.firstName,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.sex,
    required this.address,
    required this.imagePath,
    required this.userType,
    required this.createdAt,
  });
  String id;
  String surName;
  String firstName;
  String email;
  String password;
  String phoneNo;
  String sex;
  String address;
  String imagePath;
  String userType;
  DateTime createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        surName: json["surName"],
        firstName: json["firstName"],
        email: json["email"],
        password: json["password"],
        phoneNo: json["phoneNo"],
        sex: json["sex"],
        address: json["address"],
        imagePath: json["imagePath"],
        userType: json["userType"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "surName": surName,
        "firstName": firstName,
        "email": email,
        "password": password,
        "phoneNo": phoneNo,
        "sex": sex,
        "address": address,
        "imagePath": imagePath,
        "userType": userType,
        "createdAt": createdAt.toIso8601String(),
      };
}
