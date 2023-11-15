// ignore_for_file: use_build_context_synchronously

import 'package:cn_admin_panel/core/core_pattern/services/auth_service.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import '../forgot_password/forgot_password.dart';
import 'forgot_password_code.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => ForgotPasswordController();
}

class ForgotPasswordController extends State<ForgotPasswordScreen> {
  late TextEditingController emailController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool saveButtonPressed = false;

  onSubmit() async {
    setState(() {
      saveButtonPressed = true;
    });
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() {
        isLoading = true;
      });

      final res = await AuthService.reSendPasswordCode(
          email: emailController.text.trim(), cxt: context);
      if (res.statusCode == 200 || res.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        navigateToRoute(
            context,
            ForgotPasswordCodeScreen(
              email: emailController.text.trim(),
            ));
      } else {
        setState(() {
          isLoading = false;
        });
        showInfoAlertWithAction(
            context, "Email Error", "Email Does Not Exist", () {});
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  onSuccess() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ForgotPasswordCodeScreen(
    //       email: emailController.text,
    //     ),
    //   ),
    // );
  }

  // onError(String message) => showErrorToast(message);

  @override
  void initState() {
    emailController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordView(this);
  }
}
