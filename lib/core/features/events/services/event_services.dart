import 'dart:convert';

import '../../../core_pattern/helpers/endpoints.dart';
import '../../../core_pattern/helpers/globals.dart';
import '../../../core_pattern/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../../Events/model/event_model.dart';

class EventsService {
  Future<List<EventModel>> getAllEventStatus(String eventStatus) async {
    List<EventModel> randomEventModel = [];
    try {
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.eventStatusUrl}?eventStatus=$eventStatus");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("Top Events", response.body);
        return randomEventModel;
      } else {
        printData("Response", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<List<EventModel>> getAllCNEvent() async {
    List<EventModel> randomEventModel = [];
    try {
      var url = Uri.parse("${Endpoints.baseUrl}${Endpoints.cnEventUrl}");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("CN Events", response.body);
        return randomEventModel;
      } else {
        printData("CN Events", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<List<EventModel>> getAllEventList() async {
    List<EventModel> randomEventModel = [];
    try {
      var url = Uri.parse("${Endpoints.baseUrl}Event/all-events");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("All Events", response.body);
        return randomEventModel;
      } else {
        printData("Response", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<List<EventModel>> getAllRandomEvent() async {
    List<EventModel> randomEventModel = [];
    try {
      var url =
          Uri.parse("${Endpoints.baseUrl}${Endpoints.randomListEventUrl}");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("CN Events", response.body);
        return randomEventModel;
      } else {
        printData("CN Events", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<EventModel> getEventDetails(String eventId) async {
    EventModel data = EventModel();
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.eventDetailsUrl}/$eventId");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final item = json.decode(response.body);
        data = EventModel.fromJson(
            item); // Mapping json response to our data model
        printData('EventModel Details', data);
        return data;
      } else {
        printData('EventModel Details Error', response.body);
      }
    } catch (e) {
      rethrow;
    }
    return data;
  }

  Future<List<EventModel>> getUserInterestedEvent() async {
    List<EventModel> randomEventModel = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
        'userId': '${globals.userId}'
      };
      var url =
          Uri.parse("${Endpoints.baseUrl}${Endpoints.userInterestedEventUrl}");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("Interested Event", response.body);
        return randomEventModel;
      } else {
        printData("Interested Events", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<List<EventModel>> getAllEventNearYou(
      String city, String longitude, String latitude) async {
    List<EventModel> randomEventModel = [];
    try {
      var url = Uri.parse(
          "${Endpoints.baseUrl}Event/events-near-you?city=$city&longitude=$longitude&latitude=$latitude");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("Events Near You", response.body);
        return randomEventModel;
      } else {
        printData("Events Near You: Error", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<List<EventModel>> getEventCategories(String category) async {
    List<EventModel> randomEventModel = [];
    try {
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.eventCategoryUrl}?eventCategory=$category");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("Events Category", response.body);
        return randomEventModel;
      } else {
        printData("Events Category: Error", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<List<EventModel>> getAllHostEvent(String hostId) async {
    List<EventModel> randomEventModel = [];
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
        'hostId': hostId
      };
      var url = Uri.parse("${Endpoints.baseUrl}${Endpoints.eventsHost}");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        randomEventModel = eventModelFromJson(response.body);
        printData("Host Events", response.body);
        return randomEventModel;
      } else {
        printData("Response", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return randomEventModel;
  }

  Future<bool> enterEventCompetition(
      {required String eventId,
      required String competitorsName,
      required String description,
      required String phoneNo,
      required String email,
      required String imageUrl,
      required String sideTopic,
      required String address,
      required String city,
      required String state,
      required String country}) async {
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}',
      };
      final body = jsonEncode({
        "competitorsName": competitorsName,
        "description": description,
        "phoneNo": phoneNo,
        "email": email,
        "imageUrl": imageUrl,
        "sideTopic": sideTopic,
        "address": address,
        "state": state,
        "country": country,
        "city": city
      });
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.addACompetitorUrl}/$eventId");
      var response = await http.post(url, body: body, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Added A competitor", response.body);
        return true;
      } else {
        printData("competitor Error", response.body);
        return false;
      }
    } catch (e) {
      printData("Response", e.toString());
      return false;
    }
  }
}
