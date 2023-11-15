// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

List<RegisterResponseModel> registerResponseModelFromJson(String str) =>
    List<RegisterResponseModel>.from(
        json.decode(str).map((x) => RegisterResponseModel.fromJson(x)));

String registerResponseModelToJson(List<RegisterResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegisterResponseModel {
  final String? id;
  final String? email;
  final String? surName;
  final String? firstName;
  final String? staffCode;
  final int? ticketCounter;
  final String? imagePath;
  final String? sex;
  final String? twitterUrl;
  final String? instagramUrl;
  final String? facebookUrl;
  final DateTime? createdAt;

  RegisterResponseModel({
    this.id,
    this.email,
    this.surName,
    this.firstName,
    this.staffCode,
    this.ticketCounter,
    this.imagePath,
    this.sex,
    this.twitterUrl,
    this.instagramUrl,
    this.facebookUrl,
    this.createdAt,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        id: json["id"],
        email: json["email"],
        surName: json["surName"],
        firstName: json["firstName"],
        staffCode: json["staffCode"],
        ticketCounter: json["ticketCounter"],
        imagePath: json["imagePath"],
        sex: json["sex"],
        twitterUrl: json["twitterUrl"],
        instagramUrl: json["instagramUrl"],
        facebookUrl: json["facebookUrl"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "surName": surName,
        "firstName": firstName,
        "staffCode": staffCode,
        "ticketCounter": ticketCounter,
        "imagePath": imagePath,
        "sex": sex,
        "twitterUrl": twitterUrl,
        "instagramUrl": instagramUrl,
        "facebookUrl": facebookUrl,
        "createdAt": createdAt?.toIso8601String(),
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
