import 'package:cn_admin_panel/core/core_pattern/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorPage extends StatelessWidget {
  final String errorMessage;
  final Function()? onRetryPressed;

  const ErrorPage(
      {Key? key, required this.errorMessage, required this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset(
                "assets/icons/building.svg",
                height: 200,
                width: 200,
              ),
              addVerticalSpacing(20),
              Text(
                errorMessage,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: onRetryPressed,
                child: const Text('RETRY'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
