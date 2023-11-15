// To parse this JSON data, do
//
//     final courseApplicantModel = courseApplicantModelFromJson(jsonString);

import 'dart:convert';

List<CourseApplicantModel> courseApplicantModelFromJson(String str) =>
    List<CourseApplicantModel>.from(
        json.decode(str).map((x) => CourseApplicantModel.fromJson(x)));

String courseApplicantModelToJson(List<CourseApplicantModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseApplicantModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNo;
  final String? state;
  final String? residential;
  final String? sex;
  final String? course;
  final DateTime? createdAt;

  CourseApplicantModel({
    this.id,
    this.name,
    this.email,
    this.phoneNo,
    this.state,
    this.residential,
    this.sex,
    this.course,
    this.createdAt,
  });

  factory CourseApplicantModel.fromJson(Map<String, dynamic> json) =>
      CourseApplicantModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        state: json["state"],
        residential: json["residential"],
        sex: json["sex"],
        course: json["course"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phoneNo": phoneNo,
        "state": state,
        "residential": residential,
        "sex": sex,
        "course": course,
        "createdAt": createdAt?.toIso8601String(),
      };
}
