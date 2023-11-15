import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cn_admin_panel/core/core_pattern/configs/app_config.dart';
import 'package:cn_admin_panel/core/core_pattern/helpers/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../helpers/globals.dart';
import '../model/error_model.dart';
import '../utils/constants.dart';
import 'errHandler.dart';

final baseUrl = AppConfig.instance.values!.baseUrl!;

Map header() => {
      'Content-Type': 'application/json; charset=UTF-8',
    };

class ApiService {
  static get({
    required String url,
  }) async {
    Uri apiUrl = Uri.parse(baseUrl + url);
    printData('Api url', url);
    printData(url, apiUrl);
    try {
      Future<Response> apiResponse = http.get(
        apiUrl,
        headers: {...header(), 'Authorization': 'Bearer ${globals.token}'},
      ).timeout(const Duration(seconds: 30));
      Response response = await apiResponse;
      printData('Api body', (response.body));
      printData('Api status code', (response.statusCode));
      if (response.statusCode < 200 || response.statusCode > 299) {
        // throw ErrorModel.fromJson(jsonDecode(response.body));
        return response;
      }
      return apiResponse;
    } on SocketException catch (_) {
      throw printData("", "Network is down");
    } on TimeoutException catch (_) {
      throw printData("", 'Request Timeout.');
    } catch (e) {
      throw 'Request Timeout.';
    }
  }

  static getWithoutToken({
    required String url,
  }) async {
    Uri apiUrl = Uri.parse(Endpoints.baseUrl + url);
    printData('Api url', url);
    printData(url, apiUrl);
    try {
      Future<Response> apiResponse = http.get(
        apiUrl,
        headers: {
          ...header(),
        },
      ).timeout(const Duration(seconds: 30));
      Response response = await apiResponse;
      printData('Api body', (response.body));
      printData('Api status code', (response.statusCode));
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ErrorModel.fromJson(jsonDecode(response.body));
      }
      return apiResponse;
    } on SocketException catch (_) {
      throw printData("", "Network is down");
    } on TimeoutException catch (_) {
      throw printData("", 'Request Timeout.');
    } catch (e) {
      throw 'Request Timeout.';
    }
  }

  static post({
    required String url,
    body,
  }) async {
    Uri apiUrl = Uri.parse(baseUrl + url);
    printData('Api url', url);
    printData(url, apiUrl);
    printData('Api body', jsonEncode(body));
    late Response res;
    try {
      Future<Response> apiResponse = http.post(apiUrl,
          headers: {
            ...header(),
            'Authorization':
                'Bearer ${await getFromLocalStorage(name: 'token')}'
          },
          body: jsonEncode(body));
      Response response = await apiResponse;
      res = response;

      printData("code", res.statusCode);
      if (response.statusCode < 200 || response.statusCode > 299) {
        //  final error = ErrorModel.fromJson(jsonDecode(response.body));
        return response;
      }
      return apiResponse;
    } catch (e) {
      return errorHandler(
        e: e,
        response: res,
        requestBody: body,
        url: url,
      );
    }
  }

  static postWithoutToken({
    required String url,
    body,
  }) async {
    Uri apiUrl = Uri.parse(baseUrl + url);
    printData('Api url', url);
    printData(url, apiUrl);
    printData('Api body', jsonEncode(body));
    late Response res;
    try {
      Future<Response> apiResponse = http.post(apiUrl,
          headers: {
            ...header(),
          },
          body: jsonEncode(body));
      Response response = await apiResponse;
      res = response;

      printData("code", res.statusCode);
      if (response.statusCode < 200 || response.statusCode > 299) {
        //  final error = ErrorModel.fromJson(jsonDecode(response.body));
        return response;
      }
      return apiResponse;
    } catch (e) {
      return errorHandler(
        e: e,
        response: res,
        requestBody: body,
        url: url,
      );
    }
  }

  static put({
    required String url,
    body,
  }) async {
    Uri apiUrl = Uri.parse(url);
    printData('Api url', url);
    printData('Api body', jsonEncode(body));
    late Response res;
    try {
      Future<Response> apiResponse = http.put(apiUrl,
          headers: {
            ...header(),
            'Authorization':
                'Bearer ${await getFromLocalStorage(name: 'token')}'
          },
          body: jsonEncode(body));
      Response response = await apiResponse;
      res = response;
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ErrorModel.fromJson(jsonDecode(response.body));
      }
      return apiResponse;
    } catch (e) {
      return errorHandler(
        e: e,
        response: res,
        requestBody: body,
        url: url,
      );
    }
  }

  static patch({
    required String url,
    body,
  }) async {
    Uri apiUrl = Uri.parse(url);
    printData('Api url', url);
    printData('Api body', jsonEncode(body));
    late Response res;
    try {
      Future<Response> apiResponse = http.patch(apiUrl,
          headers: {
            ...header(),
            'Authorization':
                'Bearer ${await getFromLocalStorage(name: 'token')}'
          },
          body: jsonEncode(body));
      Response response = await apiResponse;
      res = response;
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ErrorModel.fromJson(jsonDecode(response.body));
      }
      return apiResponse;
    } catch (e) {
      return errorHandler(
        e: e,
        response: res,
        requestBody: body,
        url: url,
      );
    }
  }

  static delete({
    required String url,
  }) async {
    Uri apiUrl = Uri.parse(url);
    printData('Api url', url);
    late Response res;
    try {
      Future<Response> apiResponse = http.delete(
        apiUrl,
        headers: {
          ...header(),
          'Authorization': 'Bearer ${await getFromLocalStorage(name: 'token')}'
        },
      );
      Response response = await apiResponse;
      printData('Api body', (response.body));
      printData('Api status code', (response.statusCode));
      res = response;
      if (response.statusCode < 200 || response.statusCode > 299) {
        throw ErrorModel.fromJson(jsonDecode(response.body));
      }
      return apiResponse;
    } catch (e) {
      return errorHandler(
        e: e,
        response: res,
        url: url,
      );
    }
  }

  static Future<String> upload(String file) async {
    String imagePath = "";
    Map<String, String> headers2 = {
      'Content-Type': 'multipart/form-data',
      'Accept': '*/*',
      'Authorization': 'Bearer ${globals.token}',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse(Endpoints.baseUrl + Endpoints.uploadUrl));
    request.headers.addAll(headers2);
    request.files.add(await http.MultipartFile.fromPath(
      'Image',
      file,
    ));
    var res = await request.send();

    var response = await http.Response.fromStream(res);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      printData('Api body', (data));
      imagePath = data['imagePath'].toString();
      return imagePath;
    } else {
      printData('Upload Error', (response.body));
    }
    return imagePath;
  }
}
