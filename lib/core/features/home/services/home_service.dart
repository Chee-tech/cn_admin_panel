import 'dart:convert';

import '../../../core_pattern/helpers/endpoints.dart';
import '../../../core_pattern/helpers/globals.dart';
import '../../../core_pattern/utils/constants.dart';
import 'package:http/http.dart' as http;
import '../../../core_pattern/utils/package_export.dart';
import '../model/advert_model.dart';
import '../model/couser_applicant_model.dart';

class HomeService {
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

  Future<List<CourseApplicantModel>> getAllApplicants() async {
    List<CourseApplicantModel> courseModel = [];
    try {
      var url = Uri.parse("${Endpoints.baseUrl}${Endpoints.courseTrainingUrl}");
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        courseModel = courseApplicantModelFromJson(response.body);
        printData("Course Applicant", response.body);
        return courseModel;
      } else {
        printData("Response", response.body);
      }
    } catch (e) {
      printData("Response", e.toString());
    }
    return courseModel;
  }

  static Future<bool> postWeeklyTicketSale(
      {required int ticketId,
      required String retailerName,
      required String retailersState,
      required String retailersCode,
      required String names,
      required String email,
      required String phoneNo,
      required String address,
      required String prize,
      required String modeOfPurchase,
      required String ticketNo,
      required String promoCode,
      required BuildContext? cxt,
      required String url}) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}${Endpoints.monthlyTicketSalesUrl}");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "ticketId": ticketId,
          "ticketNo": ticketNo,
          "modeOfPurchase": modeOfPurchase,
          "retailerName": retailerName,
          "retailersState": retailersState,
          "ticketPrice": prize,
          "retailersCode": retailersCode,
          "buyerName": names,
          "buyerAddress": address,
          "buyerContactNo": phoneNo,
          "buyerEmail": email,
          "promoCode": promoCode,
          "paymentMethod": modeOfPurchase,
          "usersId": globals.userId,
          "retailersId": "",
        },
      );
      http.Response response =
          await http.post(stingUrl, body: msg, headers: headers);
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        return true;
        //navigateToRoute(cxt, Ta)
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<bool> postMonthlyTicketSale(
      {required int ticketId,
      required String retailerName,
      required String retailersState,
      required String retailersCode,
      required String names,
      required String email,
      required String phoneNo,
      required String address,
      required String prize,
      required String modeOfPurchase,
      required String ticketNo,
      required String promoCode,
      required BuildContext? cxt,
      required String url}) async {
    try {
      var stingUrl =
          Uri.parse("${Endpoints.baseUrl}${Endpoints.monthlyTicketSalesUrl}");
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${globals.token}'
      };
      final msg = jsonEncode(
        {
          "ticketId": ticketId,
          "ticketNo": ticketNo,
          "modeOfPurchase": modeOfPurchase,
          "retailerName": retailerName,
          "retailersState": retailersState,
          "ticketPrice": prize,
          "retailersCode": retailersCode,
          "buyerName": names,
          "buyerAddress": address,
          "buyerContactNo": phoneNo,
          "buyerEmail": email,
          "promoCode": promoCode,
          "paymentMethod": modeOfPurchase,
          "usersId": globals.userId,
          "retailersId": "",
        },
      );
      http.Response response =
          await http.post(stingUrl, body: msg, headers: headers);
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
        return true;
        //navigateToRoute(cxt, Ta)
      } else {
        printData("Error", response.body);
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
