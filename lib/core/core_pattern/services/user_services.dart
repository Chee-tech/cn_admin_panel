import 'dart:convert';

import '../helpers/endpoints.dart';
import '../helpers/globals.dart';
import '../../features/home/model/advert_model.dart';
import '../model/register_response_model.dart';
import '../utils/constants.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<RegisterResponseModel> getData() async {
    RegisterResponseModel data = RegisterResponseModel();
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/${globals.userId}");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final item = json.decode(response.body);
        data = RegisterResponseModel.fromJson(
            item); // Mapping json response to our data model
        printData('User Details', data);
        return data;
      } else {
        printData('User Details Error', response.body);
      }
    } catch (e) {
      rethrow;
    }
    return data;
  }

  static Future<RegisterResponseModel> browse() async {
    RegisterResponseModel data = RegisterResponseModel();
    try {
      Map<String, String> headers2 = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      var url = Uri.parse(
          "${Endpoints.baseUrl}${Endpoints.usersUrl}/${globals.userId}");
      var response = await http.get(url, headers: headers2);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final item = json.decode(response.body);
        data = RegisterResponseModel.fromJson(
            item); // Mapping json response to our data model
        printData('User Details', data);
        return data;
      } else {
        printData('User Details Error', response.body);
      }
    } catch (e) {
      rethrow;
    }
    return data;
  }

  Future<List<AdvertBannerModel>> getAllAdvert() async {
    List<AdvertBannerModel> advertModel = [];
    try {
      var url = Uri.parse("${Endpoints.baseUrl}Admin/AllAdvertBanner");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        advertModel = advertBannerModelFromJson(response.body);
        printData("Response", response.body);
        return advertModel;
      } else {
        printData("Response", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return advertModel;
  }

  Future<bool> updateProfilePics({
    required String imagePath,
    required String userId,
  }) async {
    try {
      var stingUrl = Uri.parse(Endpoints.baseUrl + Endpoints.profileImageUrl);
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "Id": userId,
          "imagePath": imagePath,
        },
      );
      http.Response response =
          await http.post(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> updateProfileInfo({
    required String userId,
    required String firstName,
    required String surName,
    required String phoneNo,
    required String address,
  }) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}${Endpoints.usersUrl}/$userId");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "firstName": firstName,
          "surName": surName,
          "phoneNo": phoneNo,
          "address": address,
        },
      );
      http.Response response =
          await http.put(stingUrl, body: msg, headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        getData();
        return true;
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
