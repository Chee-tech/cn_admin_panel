// To parse this JSON data, do
//
//     final ticketSalesModel = ticketSalesModelFromJson(jsonString);

import 'dart:convert';

List<TicketSalesModel> ticketSalesModelFromJson(String str) =>
    List<TicketSalesModel>.from(
        json.decode(str).map((x) => TicketSalesModel.fromJson(x)));

String ticketSalesModelToJson(List<TicketSalesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TicketSalesModel {
  final int? numed;
  final String? id;
  final String? ticketNo;
  final String? modeOfPurchase;
  final String? retailerName;
  final dynamic retailerCode;
  final String? buyerName;
  final String? buyerAddress;
  final String? buyerContactNo;
  final String? buyerEmail;
  final String? paymentMethod;
  final String? usersId;
  final String? retailersId;
  final String? shopOwnersId;
  final DateTime? createdAt;
  final List<UniFeeBonus>? uniFeeBonus;

  TicketSalesModel({
    this.numed,
    this.id,
    this.ticketNo,
    this.modeOfPurchase,
    this.retailerName,
    this.retailerCode,
    this.buyerName,
    this.buyerAddress,
    this.buyerContactNo,
    this.buyerEmail,
    this.paymentMethod,
    this.usersId,
    this.retailersId,
    this.shopOwnersId,
    this.createdAt,
    this.uniFeeBonus,
  });

  factory TicketSalesModel.fromJson(Map<String, dynamic> json) =>
      TicketSalesModel(
        numed: json["num"],
        id: json["id"],
        ticketNo: json["ticketNo"] ?? "",
        modeOfPurchase: json["modeOfPurchase"] ?? "",
        retailerName: json["retailerName"] ?? "",
        retailerCode: json["retailerCode"] ?? "",
        buyerName: json["buyerName"] ?? "",
        buyerAddress: json["buyerAddress"] ?? "",
        buyerContactNo: json["buyerContactNo"] ?? "",
        buyerEmail: json["buyerEmail"] ?? "",
        paymentMethod: json["paymentMethod"] ?? "",
        usersId: json["usersId"] ?? "",
        retailersId: json["retailersId"] ?? "",
        shopOwnersId: json["shopOwnersId"] ?? "",
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        uniFeeBonus: json["uniFeeBonus"] == null
            ? []
            : List<UniFeeBonus>.from(
                json["uniFeeBonus"]!.map((x) => UniFeeBonus.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "num": numed,
        "id": id,
        "ticketNo": ticketNo,
        "modeOfPurchase": modeOfPurchase,
        "retailerName": retailerName,
        "retailerCode": retailerCode,
        "buyerName": buyerName,
        "buyerAddress": buyerAddress,
        "buyerContactNo": buyerContactNo,
        "buyerEmail": buyerEmail,
        "paymentMethod": paymentMethod,
        "usersId": usersId,
        "retailersId": retailersId,
        "shopOwnersId": shopOwnersId,
        "createdAt": createdAt?.toIso8601String(),
        "uniFeeBonus": uniFeeBonus == null
            ? []
            : List<dynamic>.from(uniFeeBonus!.map((x) => x.toJson())),
      };
}

class UniFeeBonus {
  final int? numed;
  final String? id;
  final String? ticketNo;
  final String? bonusTicketNo;
  final bool? ticketSale;
  final String? uniFeeTicketSalesId;
  final DateTime? createdAt;

  UniFeeBonus({
    this.numed,
    this.id,
    this.ticketNo,
    this.bonusTicketNo,
    this.ticketSale,
    this.uniFeeTicketSalesId,
    this.createdAt,
  });

  factory UniFeeBonus.fromJson(Map<String, dynamic> json) => UniFeeBonus(
        numed: json["num"],
        id: json["id"],
        ticketNo: json["ticketNo"],
        bonusTicketNo: json["bonusTicketNo"],
        ticketSale: json["ticketSale"],
        uniFeeTicketSalesId: json["uniFeeTicketSalesId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "num": numed,
        "id": id,
        "ticketNo": ticketNo,
        "bonusTicketNo": bonusTicketNo,
        "ticketSale": ticketSale,
        "uniFeeTicketSalesId": uniFeeTicketSalesId,
        "createdAt": createdAt?.toIso8601String(),
      };
}
