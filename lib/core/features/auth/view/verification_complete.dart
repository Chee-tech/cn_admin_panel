import 'package:cn_admin_panel/core/core_pattern/utils/colors.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/helper_functions.dart';
import 'package:cn_admin_panel/core/features/auth/controller/login_controller.dart';
import 'package:flutter/material.dart';

class VerificationCompleteScreen extends StatelessWidget {
  const VerificationCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.done,
                size: 80,
                color: Colors.white,
              ),
            ),
            addVerticalSpacing(30),
            const Text(
              "Email Verification Complete",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            addVerticalSpacing(40),
            InkWell(
              onTap: () {
                navigateAndRemoveUntilRoute(context, const LoginScreens());
              },
              child: const Text(
                "Login to complete verification process",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
