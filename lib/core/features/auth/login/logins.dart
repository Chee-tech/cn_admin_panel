import 'package:cn_admin_panel/core/core_pattern/utils/app_buttons.dart';
import 'package:cn_admin_panel/core/core_pattern/widgets/app_text.dart';
import 'package:cn_admin_panel/core/core_pattern/widgets/input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core_pattern/architecture/mvc.dart';
import '../../../core_pattern/utils/colors.dart';
import '../../../core_pattern/utils/helper_functions.dart';
import '../controller/forgot_password.dart';
import '../controller/login_controller.dart';

class LoginScreensView
    extends StatelessView<LoginScreens, LoginScreensController> {
  const LoginScreensView(LoginScreensController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              height: 180.h,
              width: getScreenWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpacing(1.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "CN Ticket Admin Panel",
                          style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "Login to your account",
                          style: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            addVerticalSpacing(40.h),
            SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 20.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Input(
                        controller: controller.emailController,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        hintText: "Your Email",
                        prefixIcon: Icons.person,
                        labelText: "Email",
                        keyboard: TextInputType.text,
                        validator: (value) {
                          String trimValue =
                              controller.emailController.text.trim();
                          if (EmailValidator.validate(trimValue) == false) {
                            return 'Enter a valid email';
                          }

                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                        onChanged: (String? value) {},
                      ),
                      addVerticalSpacing(24.h),
                      PasswordInput(
                        obscureText: controller.obscureText,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        passwordIcon: GestureDetector(
                          onTap: () {
                            controller.obscureTextPassword();
                          },
                          child: Icon(
                            controller.obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.black,
                          ),
                        ),
                        controller: controller.passwordController,
                        hintText: "Your Password",
                        prefixIcon: Icons.lock,
                        labelText: "Password",
                        keyboard: TextInputType.text,
                        onChanged: (String? value) {},
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "Enter a valid password";
                          }
                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                      ),
                      addVerticalSpacing(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                navigateToRoute(
                                    context, const ForgotPasswordScreen());
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: AppColors.green,
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.w400),
                              ))
                        ],
                      ),
                      addVerticalSpacing(24.h),
                      appButton("LOG IN", getScreenWidth(context), () {
                        controller.loginUser();
                      }, AppColors.green, controller.isLoading)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
