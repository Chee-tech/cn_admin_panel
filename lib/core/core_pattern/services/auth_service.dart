// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:cn_admin_panel/core/core_pattern/utils/constants.dart';
import '../helpers/endpoints.dart';
import '../helpers/globals.dart';
import '../model/login_response_model.dart';
import '../utils/helper_functions.dart';
import '../utils/package_export.dart';
import 'base.dart';

class AuthService {
  static userLogin(
      {required String email,
      required String password,
      required BuildContext? cxt}) async {
    String url = Endpoints.usersLoginUrl;
    try {
      final response = await ApiService.postWithoutToken(
        url: url,
        body: {
          "email": email,
          "password": password,
        },
      );
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonDecode(response.body));
        setToLocalStorage(name: "token", data: loginResponseModel.token);
        setToLocalStorage(name: "userEmail", data: loginResponseModel.email);
        setToLocalStorage(name: "userPassword", data: password);
        setToLocalStorage(name: "userId", data: loginResponseModel.userId);
        globals.init();
      } else if (response.body == "User Email Not Yet Verify") {
        ScaffoldMessenger.of(cxt!).showSnackBar(
            const SnackBar(content: Text("New code sent to your email")));
        // navigateAndRemoveUntilRoute(
        //     cxt,
        //     ConfirmEmailAddressScreen(
        //       email: email,
        //       fromLogin: false,
        //       password: password,
        //     ));
      } else {
        printData("errors", response.body);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static verifyEmail(
      {required String password, pin, required BuildContext? cxt}) async {
    String url = Endpoints.emailVerificationUrl;
    try {
      final response = await ApiService.postWithoutToken(
        url: url,
        body: {"token": pin, "password": password},
      );
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonDecode(response.body));
        setToLocalStorage(name: "token", data: loginResponseModel.token);
        setToLocalStorage(name: "userEmail", data: loginResponseModel.email);
        setToLocalStorage(name: "userPassword", data: password);
        setToLocalStorage(name: "userId", data: loginResponseModel.userId);
        setToLocalStorage(name: "isLoggedIn", data: "isLoggedIn");
        globals.init();
        printData("verify", response.body);
      } else {
        printData("errors", response.body);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static sendVerificationCode(
      {required String email, required BuildContext? cxt}) async {
    String url = Endpoints.resendEmailVerificationTokenUrl;
    try {
      final response = await ApiService.postWithoutToken(
        url: url,
        body: {
          "email": email,
        },
      );
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
      } else {
        printData("Errors", response.body);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static reSendPasswordCode(
      {required String email, required BuildContext? cxt}) async {
    String url = Endpoints.forgetPasswordUrl;
    try {
      final response = await ApiService.postWithoutToken(
        url: url,
        body: {
          "email": email,
        },
      );
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
      } else {
        printData("Errors", response.body);
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static forgotPassword(
      {required String token,
      required String password,
      required BuildContext? cxt}) async {
    String url = Endpoints.resetPasswordUrl;
    try {
      final response = await ApiService.postWithoutToken(
        url: url,
        body: {
          "token": token,
          "password": password,
        },
      );
      printData("dataResponse", response.body);
      printData("dataResponse", response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("Response", response.body);
      } else {
        printData("Errors", response.body);
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
