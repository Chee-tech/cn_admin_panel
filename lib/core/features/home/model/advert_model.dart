// To parse this JSON data, do
//
//     final advertBannerModel = advertBannerModelFromJson(jsonString);

import 'dart:convert';

List<AdvertBannerModel> advertBannerModelFromJson(String str) =>
    List<AdvertBannerModel>.from(
        json.decode(str).map((x) => AdvertBannerModel.fromJson(x)));

String advertBannerModelToJson(List<AdvertBannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvertBannerModel {
  int? id;
  String? bannerTitle;
  String? bannerSubTitles;
  String? bannerImage;
  DateTime? createdAt;

  AdvertBannerModel({
    this.id,
    this.bannerTitle,
    this.bannerSubTitles,
    this.bannerImage,
    this.createdAt,
  });

  factory AdvertBannerModel.fromJson(Map<String, dynamic> json) =>
      AdvertBannerModel(
        id: json["id"],
        bannerTitle: json["bannerTitle"],
        bannerSubTitles: json["bannerSubTitles"],
        bannerImage: json["bannerImage"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bannerTitle": bannerTitle,
        "bannerSubTitles": bannerSubTitles,
        "bannerImage": bannerImage,
        "createdAt": createdAt?.toIso8601String(),
      };
}
