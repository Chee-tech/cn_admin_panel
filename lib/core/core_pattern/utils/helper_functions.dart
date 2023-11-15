import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'dart:typed_data';

import '../routes/routers.dart';
import 'colors.dart';

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String), width: 40, height: 40);
}

Uint8List dataFromBase64String(String base64String) {
  return base64Decode(base64String);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

Widget addSeperator(Color color, double height) {
  return Divider(color: color, height: height.h);
}

Widget addSeperatorDarkMode(bool darkMode, double height) {
  return Divider(color: darkMode ? Colors.grey : Colors.grey, height: height.h);
}

Widget addVerticalSpacing(double height) {
  return SizedBox(height: height.h);
}

Widget addHorizontalSpacing(double width) {
  return SizedBox(width: width.w);
}

double getPercentageHeight(BuildContext context, double height) {
  var heightPercentage = (height / 100) * getScreenHeight(context);
  return heightPercentage;
}

double getPercentageWidth(BuildContext context, double width) {
  var widthPercentage = (width / 100) * getScreenWidth(context);
  return widthPercentage;
}

double buttonHeight = 50;

String convertToTitleCase(String? text) {
  if (text == null) {
    return "Not Assigned";
  }

  text = text.toLowerCase();

  if (text.length <= 1) {
    return text.toUpperCase();
  }

  // Split string into multiple words
  final List<String> words = text.split(' ');

  // Capitalize first letter of each words
  final capitalizedWords = words.map((word) {
    if (word.trim().isNotEmpty) {
      final String firstLetter = word.trim().substring(0, 1).toUpperCase();
      final String remainingLetters = word.trim().substring(1);

      return '$firstLetter$remainingLetters';
    }
    return '';
  });

  // Join/Merge all words back to one String
  return capitalizedWords.join(' ');
}

Widget produceButton(
    String text, Color color, double width, VoidCallback onPressed,
    [double height = 50,
    Color textColor = Colors.white,
    double fontSize = 14]) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: Text(text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontWeight: FontWeight.normal))),
  );
}

Widget produceSmallButton(
    String text, Color color, double width, VoidCallback onPressed,
    [double height = 50,
    Color textColor = Colors.white,
    double fontSize = 12]) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24.0).w,
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize.sp,
                fontWeight: FontWeight.normal)),
      ),
    ),
  );
}

Widget produceImage(String imgPath, double imgWidth, double imgHeight,
    [BoxFit fit = BoxFit.contain]) {
  return Image.asset(
    imgPath,
    fit: fit,
    width: imgWidth,
    height: imgHeight,
  );
}

Widget showCircularLoadingIndicator = Align(
    alignment: Alignment.center,
    child: Container(
        color: Colors.black.withOpacity(0.5),
        width: 100,
        height: 100,
        child: showAppLoader));

//non - functions
Widget showAppLoader = const Center(
  child: CircularProgressIndicator(
    color: Colors.yellowAccent,
    backgroundColor: Colors.white,
  ),
);

String getNairaSymbol() {
  return "\u{20A6}";
}

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void popSheet(BuildContext context) {
  Navigator.of(context).pop();
}

void navigateToRoute(BuildContext context, dynamic routeClass) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => routeClass));
}

void navigateAndReplaceRoute(BuildContext context, dynamic routeClass) {
  Navigator.pushReplacement(
      context, CupertinoPageRoute(builder: (context) => routeClass));
}

void navigateAndRemoveUntilRoute(BuildContext context, dynamic routeClass) {
  Navigator.pushAndRemoveUntil(context,
      CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
}

navPush(BuildContext context, String route) {
  Navigator.push(context, generateRoute(RouteSettings(name: route)));
}

//Alerts

showInfoAlertWithAction(BuildContext context, String title, String description,
    Function onPressed) {
  showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        CupertinoDialogAction(
            child: const Text("Ok"),
            onPressed: () {
              Navigator.of(context).pop(true);
              onPressed();
            }),
      ],
    ),
  );
}

showCancelOrProceedAlert(
    {required BuildContext context,
    required String title,
    required String description,
    String cancel = "Cancel",
    String proceed = "Proceed",
    required VoidCallback onPressed}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            cancel,
            style: const TextStyle(color: AppColors.primary),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(true),
        ),
        CupertinoDialogAction(
          onPressed: onPressed,
          child: Text(proceed),
        ),
      ],
    ),
  );
}

showThreeOptionsAlert({
  required BuildContext context,
  required String title,
  required String description,
  String cancel = "Cancel",
  required String titleOne,
  required String titleTwo,
  required VoidCallback onPressedOne,
  required VoidCallback onPressedTwo,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: onPressedOne,
          child: Text(titleOne),
        ),
        CupertinoDialogAction(
          onPressed: onPressedTwo,
          child: Text(titleTwo),
        ),
        CupertinoDialogAction(
          child: Text(
            cancel,
            style: const TextStyle(color: AppColors.primary),
          ),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    ),
  );
}

displayBottomSheet(context, Widget bottomSheet) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      builder: (context) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: GestureDetector(onTap: dismissKeyboard, child: bottomSheet)));
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class DrawDottedhorizontalline extends CustomPainter {
  late Paint _paint;
  DrawDottedhorizontalline() {
    _paint = Paint();
    _paint.color = Colors.black; //dots color
    _paint.strokeWidth = 2; //dots thickness
    _paint.strokeCap = StrokeCap.square; //dots corner edges
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      // 15 is space between dots
      if (i % 3 == 0) {
        canvas.drawLine(Offset(i, 0.0), Offset(i + 10, 0.0), _paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
