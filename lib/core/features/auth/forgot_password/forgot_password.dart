import 'package:cn_admin_panel/core/core_pattern/utils/colors.dart';
import 'package:cn_admin_panel/core/core_pattern/widgets/input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core_pattern/architecture/mvc.dart';
import '../../../core_pattern/utils/app_buttons.dart';
import '../../../core_pattern/utils/helper_functions.dart';
import '../controller/forgot_password.dart';

class ForgotPasswordView
    extends StatelessView<ForgotPasswordScreen, ForgotPasswordController> {
  const ForgotPasswordView(ForgotPasswordController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 24.0, bottom: 24, left: 24, top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter the email address you registered with.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff828282),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Input(
                    controller: controller.emailController,
                    fillColor: const Color.fromARGB(255, 243, 247, 245),
                    hintText: "Your Email",
                    prefixIcon: Icons.person,
                    labelText: "Email",
                    keyboard: TextInputType.text,
                    onChanged: (String? value) {},
                    validator: (value) {
                      String trimValue = controller.emailController.text.trim();
                      if (EmailValidator.validate(trimValue) == false) {
                        return 'enter a valid email';
                      }

                      return null;
                    },
                    toggleEye: () {},
                    onSaved: (value) {},
                    onTap: () {},
                  ),
                  addVerticalSpacing(80.h),
                  appButton("RESET PASSWORD", getScreenWidth(context), () {
                    controller.onSubmit();
                  }, AppColors.green, controller.isLoading)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
