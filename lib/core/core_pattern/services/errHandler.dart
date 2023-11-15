// ignore_for_file: file_names

import 'dart:async';
import 'dart:io';
import 'package:http/http.dart';
import '../model/error_model.dart';

/// This is an array of possible error code from the api
final errList = [
  {'code': 600, 'description': 'This email has been registered before.'},
  {'code': 601, 'description': 'Incorrect Email'},
  {'code': 602, 'description': 'Incorrect Password'},
  {'code': 603, 'description': 'Field Is Required'},
  {'code': 604, 'description': 'Maximum Character Length Exceeded'},
  {'code': 605, 'description': 'Invalid Date Format'},
  {'code': 606, 'description': 'Invalid Email Address'},
  {'code': 607, 'description': 'This phone number has been registered before.'},
  {'code': 610, 'description': 'Invalid Otp'},
  {'code': 611, 'description': 'Otp Request Exceeded'},
  {'code': 612, 'description': 'Recaptcha Token Verification Failed'},
  {'code': 614, 'description': 'Email Confirmation Failed'},
  {'code': 615, 'description': 'Token Verification Failed'},
  {'code': 616, 'description': 'Business Registration Number Is Required'},
  {'code': 617, 'description': 'Authentication Failed'},
  {'code': 618, 'description': 'Login Failed'},
  {'code': 619, 'description': 'User Creation Failed'},
  {'code': 620, 'description': 'Invalid Password Reset Token'},
  {'code': 621, 'description': 'Password Reset Failed'},
  {'code': 625, 'description': 'Cannot Be Less Than Zero'},
  {'code': 626, 'description': 'Cannot Be Greater Than Amount'},
  {'code': 627, 'description': 'Date Cannot Be Greater Than Today'},
  {'code': 628, 'description': 'Invalid Tax Entry'},
  {'code': 629, 'description': 'User does not exist'},
  {'code': 630, 'description': 'You have not sent a payment to add'},
  {'code': 690, 'description': 'Out of range'},
  {'code': 691, 'description': 'Data Not Found'},
];

/// THis errHandler function basically compares the error code from the api
/// with the error codes available in the errList array, if for some reason the
/// error code isn't available a default error message wiil be sent

errorHandler(
    {dynamic requestBody,
    dynamic e,
    String? url,
    Response? response,
    }) async {
  String errMessage = 'Error Occurred';
  if (e is ErrorModel) {
    errMessage = e.message!;
  }
  if (e is SocketException) {
    errMessage = 'Kindly, check your internet connection.';
  }
  if (e is TimeoutException) {
    errMessage = 'Request Timeout.';
  }
  if (e is FormatException) {
    errMessage = 'oops an error occurred, please try again.';
  }

  
  
  throw errMessage;
}

// showLoader(ctx) {
//   return Loader.show(
//     ctx,
//     progressIndicator: CircularProgressIndicator(
//       backgroundColor: primaryColor,
//       valueColor: AlwaysStoppedAnimation<Color>(yellow),
//     ),
//   );
// }

// hideLoader() {
//   return Loader.hide();
// }
