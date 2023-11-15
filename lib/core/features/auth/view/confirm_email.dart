import 'package:cn_admin_panel/core/core_pattern/utils/app_buttons.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/colors.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/helper_functions.dart';
import 'package:cn_admin_panel/core/features/auth/controller/confirm_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pinput/pinput.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../core_pattern/architecture/mvc.dart';
import '../../../core_pattern/helpers/globals.dart';

class ConfirmEmailAddressView extends StatelessView<ConfirmEmailAddressScreen,
    ConfirmEmailAddressController> {
  const ConfirmEmailAddressView(ConfirmEmailAddressController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        //bottomNavigationBar:

        //BottomAppBar(

        //  BottomAppBar(
        //   elevation: 0,
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 20),

        //   )

        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 24.0, bottom: 24, left: 24, top: 100),
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/icons/msg.svg",
                height: 100,
                width: 130,
              ),
              const Text(
                'Verify Your Email',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff071E3B),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'We have sent an OTP to ',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                  Text(
                    widget.fromLogin == false ? widget.email : widget.email,
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
              //const SizedBox(height: 8),

              const SizedBox(height: 60),
              Pinput(
                length: 5,
                controller: controller.pinPutController,
                onCompleted: (value) => controller.submit(),
                onChanged: (value) {
                  controller.getPin(value);
                },
              ),
              const SizedBox(height: 32),
              IgnorePointer(
                ignoring: controller.pin.isEmpty || controller.pin.length < 5,
                child: controller.isLoading
                    ? const SpinKitThreeBounce(
                        color: AppColors.primary,
                        size: 16,
                      )
                    : appButtons(
                        "VERIFY MAIL",
                        getScreenWidth(context),
                        () {
                          controller.submit();
                        },
                        controller.pin.isEmpty || controller.pin.length < 5
                            ? AppColors.grey
                            : AppColors.primary,
                      ),
              ),

              const SizedBox(height: 50),
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
                          ? AppColors.primary
                          : AppColors.white,
                    ),
                  );
                },
              ),
              addVerticalSpacing(10),
              TextButton(
                onPressed: globals.stopWatchTimer!.isRunning
                    ? null
                    : () => controller.resendCode(),
                child: const Text('Resend mail'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
