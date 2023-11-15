import 'package:cn_admin_panel/core/core_pattern/utils/constants.dart';

errorHandle(e, ctx) async {
  String? errMessage;
  if (e.toString().contains('No internet connection')) {
    errMessage = "No internet connection";
    showErrorMsg(cxt: ctx, msg: errMessage);
  } else if (e.toString().contains('Failed to connect to the network')) {
    errMessage = 'Failed to connect to the network, Please check your network';
    showErrorMsg(cxt: ctx, msg: errMessage);
  } else if (e.toString().contains("Couldn't find the get request endpoint")) {
    errMessage = "Couldn't find the get request endpoint";
    showErrorMsg(cxt: ctx, msg: errMessage);
  } else if (e.toString().contains(
      'Failed to connect to the network, Please check your network')) {
    errMessage = 'Failed to log in';
    showErrorMsg(cxt: ctx, msg: errMessage);
  } else if (e.toString().contains(' "Failed host lookup: traqapps.com" ')) {
    errMessage = 'Failed to log in';
    showErrorMsg(cxt: ctx, msg: errMessage);
  } else {
    errMessage = 'An error occured, Please try again';
    showErrorMsg(cxt: ctx, msg: errMessage);
  }
  printData("eerrroe", errMessage);
  throw errMessage;
}
