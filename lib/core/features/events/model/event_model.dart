// To parse this JSON data, do
//
//     final eventModel = eventModelFromJson(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromJson(String str) =>
    List<EventModel>.from(json.decode(str).map((x) => EventModel.fromJson(x)));

String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EventModel {
  final int? eventNum;
  final String? id;
  final String? eventTitle;
  final String? eventDescription;
  final String? eventType;
  final String? eventCategories;
  final String? whoCanAttend;
  final String? eventStatus;
  final String? eventStartDate;
  final String? eventEndDate;
  final String? location;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;
  final String? latitude;
  final String? longitude;
  final String? ticketType;
  final String? ticketPrice;
  final int? ticketQuantity;
  final int? ticketSold;
  final String? ticketInfo;
  final String? ticketPromoCode;
  final int? ticketDiscount;
  final int? shares;
  final String? sharesLink;
  final int? invited;
  final int? interested;
  final int? attending;
  final String? host;
  final String? hostId;
  final List<ListEventsImage>? listEventsImages;
  final List<AttendingEvent>? eventDiscussions;
  final List<AttendingEvent>? interestedOnEvent;
  final List<AttendingEvent>? attendingEvent;
  final String? hostProfileUrl;
  final DateTime? createdAt;

  EventModel({
    this.eventNum,
    this.id,
    this.eventTitle,
    this.eventDescription,
    this.eventType,
    this.eventCategories,
    this.whoCanAttend,
    this.eventStatus,
    this.eventStartDate,
    this.eventEndDate,
    this.location,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.latitude,
    this.longitude,
    this.ticketType,
    this.ticketPrice,
    this.ticketQuantity,
    this.ticketSold,
    this.ticketInfo,
    this.ticketPromoCode,
    this.ticketDiscount,
    this.shares,
    this.sharesLink,
    this.invited,
    this.interested,
    this.attending,
    this.host,
    this.hostId,
    this.listEventsImages,
    this.eventDiscussions,
    this.interestedOnEvent,
    this.attendingEvent,
    this.hostProfileUrl,
    this.createdAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventNum: json["eventNum"],
        id: json["id"],
        eventTitle: json["eventTitle"],
        eventDescription: json["eventDescription"],
        eventType: json["eventType"],
        eventCategories: json["eventCategories"],
        whoCanAttend: json["whoCanAttend"],
        eventStatus: json["eventStatus"],
        eventStartDate: json["eventStartDate"],
        eventEndDate: json["eventEndDate"],
        location: json["location"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zipCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        ticketType: json["ticketType"],
        ticketPrice: json["ticketPrice"],
        ticketQuantity: json["ticketQuantity"],
        ticketSold: json["ticketSold"],
        ticketInfo: json["ticketInfo"],
        ticketPromoCode: json["ticketPromoCode"],
        ticketDiscount: json["ticketDiscount"],
        shares: json["shares"],
        sharesLink: json["sharesLink"],
        invited: json["invited"],
        interested: json["interested"],
        attending: json["attending"],
        host: json["host"],
        hostId: json["hostId"],
        listEventsImages: json["listEventsImages"] == null
            ? []
            : List<ListEventsImage>.from(json["listEventsImages"]!
                .map((x) => ListEventsImage.fromJson(x))),
        eventDiscussions: json["eventDiscussions"] == null
            ? []
            : List<AttendingEvent>.from(json["eventDiscussions"]!
                .map((x) => AttendingEvent.fromJson(x))),
        interestedOnEvent: json["interestedOnEvent"] == null
            ? []
            : List<AttendingEvent>.from(json["interestedOnEvent"]!
                .map((x) => AttendingEvent.fromJson(x))),
        attendingEvent: json["attendingEvent"] == null
            ? []
            : List<AttendingEvent>.from(
                json["attendingEvent"]!.map((x) => AttendingEvent.fromJson(x))),
        hostProfileUrl: json["hostProfileUrl"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "eventNum": eventNum,
        "id": id,
        "eventTitle": eventTitle,
        "eventDescription": eventDescription,
        "eventType": eventType,
        "eventCategories": eventCategories,
        "whoCanAttend": whoCanAttend,
        "eventStatus": eventStatus,
        "eventStartDate": eventStartDate,
        "eventEndDate": eventEndDate,
        "location": location,
        "city": city,
        "state": state,
        "country": country,
        "zipCode": zipCode,
        "latitude": latitude,
        "longitude": longitude,
        "ticketType": ticketType,
        "ticketPrice": ticketPrice,
        "ticketQuantity": ticketQuantity,
        "ticketSold": ticketSold,
        "ticketInfo": ticketInfo,
        "ticketPromoCode": ticketPromoCode,
        "ticketDiscount": ticketDiscount,
        "shares": shares,
        "sharesLink": sharesLink,
        "invited": invited,
        "interested": interested,
        "attending": attending,
        "host": host,
        "hostId": hostId,
        "listEventsImages": listEventsImages == null
            ? []
            : List<dynamic>.from(listEventsImages!.map((x) => x.toJson())),
        "eventDiscussions": eventDiscussions == null
            ? []
            : List<dynamic>.from(eventDiscussions!.map((x) => x.toJson())),
        "interestedOnEvent": interestedOnEvent == null
            ? []
            : List<dynamic>.from(interestedOnEvent!.map((x) => x.toJson())),
        "attendingEvent": attendingEvent == null
            ? []
            : List<dynamic>.from(attendingEvent!.map((x) => x.toJson())),
        "hostProfileUrl": hostProfileUrl,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class AttendingEvent {
  final int? id;
  final String? name;
  final String? profileImage;
  final int? ticketQuatity;
  final String? userId;
  final String? eventDataTablesId;
  final DateTime? createdAt;
  final String? discussions;

  AttendingEvent({
    this.id,
    this.name,
    this.profileImage,
    this.ticketQuatity,
    this.userId,
    this.eventDataTablesId,
    this.createdAt,
    this.discussions,
  });

  factory AttendingEvent.fromJson(Map<String, dynamic> json) => AttendingEvent(
        id: json["id"],
        name: json["name"],
        profileImage: json["profileImage"],
        ticketQuatity: json["ticketQuatity"],
        userId: json["userId"],
        eventDataTablesId: json["eventDataTablesId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        discussions: json["discussions"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profileImage": profileImage,
        "ticketQuatity": ticketQuatity,
        "userId": userId,
        "eventDataTablesId": eventDataTablesId,
        "createdAt": createdAt?.toIso8601String(),
        "discussions": discussions,
      };
}

class ListEventsImage {
  final int? id;
  final String? imagePath;
  final String? eventDataTablesId;
  final DateTime? createdAt;

  ListEventsImage({
    this.id,
    this.imagePath,
    this.eventDataTablesId,
    this.createdAt,
  });

  factory ListEventsImage.fromJson(Map<String, dynamic> json) =>
      ListEventsImage(
        id: json["id"],
        imagePath: json["imagePath"],
        eventDataTablesId: json["eventDataTablesId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagePath": imagePath,
        "eventDataTablesId": eventDataTablesId,
        "createdAt": createdAt?.toIso8601String(),
      };
}
