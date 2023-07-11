// To parse this JSON data, do
//
//     final TicketNosModel = TicketNosModelFromJson(jsonString);

import 'dart:convert';

TicketNosModel ticketNosModelFromJson(String str) =>
    TicketNosModel.fromJson(json.decode(str));

String ticketNosModelToJson(TicketNosModel data) => json.encode(data.toJson());
List<TicketNosModel> postModeFromJson(String str) => List<TicketNosModel>.from(
    json.decode(str).map((x) => TicketNosModel.fromJson(x)));

class TicketNosModel {
  int? id;
  String? ticketNo;
  bool? ticketSale;
  DateTime? createdAt;

  TicketNosModel({
    this.id,
    this.ticketNo,
    this.ticketSale,
    this.createdAt,
  });

  factory TicketNosModel.fromJson(Map<String, dynamic> json) => TicketNosModel(
    id: json["id"],
    ticketNo: json["ticketNo"],
    ticketSale: json["ticketSale"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ticketNo": ticketNo,
    "ticketSale": ticketSale,
    "createdAt": createdAt?.toIso8601String(),
  };
}
