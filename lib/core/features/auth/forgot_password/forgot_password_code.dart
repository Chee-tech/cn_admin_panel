import 'package:cn_admin_panel/core/core_pattern/utils/app_buttons.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/colors.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/package_export.dart';
import 'package:cn_admin_panel/core/core_pattern/widgets/input.dart';
import '../../../core_pattern/architecture/mvc.dart';
import '../../../core_pattern/helpers/globals.dart';
import '../../../core_pattern/utils/helper_functions.dart';
import '../../../core_pattern/widgets/back_icon.dart';
import '../controller/forgot_password_code.dart';

class ForgotPasswordCodeScreenView extends StatelessView<
    ForgotPasswordCodeScreen, ForgotPasswordCodeController> {
  const ForgotPasswordCodeScreenView(ForgotPasswordCodeController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackIcon(),
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: getScreenHeight(context),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.only(
                left: 14.0.w,
                right: 14.0.w,
                top: 20.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Change password ",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  addVerticalSpacing(15.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email OTP",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      PlainInput(
                        controller: controller.codeController,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        hintText: "Email OTP",
                        prefixIcon: Icons.code,
                        labelText: "Email OTP",
                        focusNode: controller.codeFocusNode,
                        keyboard: TextInputType.number,
                        maxLength: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter OTP';
                          }
                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                        onChanged: (String? value) {},
                      ),
                    ],
                  ),
                  addVerticalSpacing(15.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "New Password",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      PasswordInput(
                        obscureText: controller.obscureText,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        focusNode: controller.newPasswordFocusNode,
                        passwordIcon: GestureDetector(
                          onTap: () {
                            controller.obscureTextPassword();
                          },
                          child: Icon(
                            controller.obscureText
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                        controller: controller.newPasswordController,
                        hintText: "New Password",
                        prefixIcon: Icons.lock,
                        labelText: "New Password",
                        keyboard: TextInputType.text,
                        onChanged: (String? value) {},
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "enter a valid password";
                          } else if (value.length < 8) {
                            return "password must be 8 characters";
                          } else if (!controller.passValid.hasMatch(value)) {
                            return "password must contain at least one uppercase letter, one lowercase letter, one number";
                          }
                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                      ),
                    ],
                  ),
                  addVerticalSpacing(15.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.black,
                            fontWeight: FontWeight.w700),
                      ),
                      PasswordInput(
                        obscureText: controller.obscureConfirmPassword,
                        focusNode: controller.confirmPasswordFocusNode,
                        fillColor: const Color.fromARGB(255, 243, 247, 245),
                        passwordIcon: GestureDetector(
                          onTap: () {
                            controller.obscureTextConfirmPassword();
                          },
                          child: Icon(
                            controller.obscureConfirmPassword
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                        controller: controller.confirmPasswordController,
                        hintText: "Confirm Password",
                        prefixIcon: Icons.lock,
                        labelText: "Confirm Password",
                        keyboard: TextInputType.text,
                        onChanged: (String? value) {},
                        validator: (String? value) {
                          if (value!.isEmpty || value.length < 3) {
                            return "enter a valid password";
                          } else if (controller.newPasswordController.text !=
                              controller.confirmPasswordController.text) {
                            return "password do not match";
                          }
                          return null;
                        },
                        toggleEye: () {},
                        onSaved: (value) {},
                        onTap: () {},
                      ),
                    ],
                  ),
                  addVerticalSpacing(40.h),
                  appButton("Update Password", getScreenWidth(context), () {
                    controller.onSubmit();
                  }, AppColors.green, controller.isLoading),
                  addVerticalSpacing(20.h),
                  StreamBuilder<int>(
                    stream: globals.stopWatchTimer!.rawTime,
                    initialData: 0,
                    builder: (context, snap) {
                      final value = snap.data;
                      final displayTime = StopWatchTimer.getDisplayTime(
                        value!,
                        milliSecond: false,
                        minute: false,
                        hours: false,
                      );
                      return Text(
                        '$displayTime seconds',
                        style: TextStyle(
                          color: globals.stopWatchTimer!.isRunning
                              ? AppColors.green
                              : AppColors.white,
                        ),
                      );
                    },
                  ),
                  addVerticalSpacing(10.h),
                  TextButton(
                    onPressed: globals.stopWatchTimer!.isRunning
                        ? null
                        : () => controller.resendCode(),
                    child: const Text('Resend mail'),
                  ),
                  addVerticalSpacing(80.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
