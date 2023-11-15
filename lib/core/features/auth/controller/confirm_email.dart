// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../core_pattern/helpers/globals.dart';
import '../../../core_pattern/services/auth_service.dart';
import '../../../core_pattern/utils/constants.dart';
import '../../../core_pattern/utils/helper_functions.dart';
import '../../home.dart';
import '../view/confirm_email.dart';

class ConfirmEmailAddressScreen extends StatefulWidget {
  final String email;
  final String password;
  final bool fromLogin;
  const ConfirmEmailAddressScreen(
      {Key? key,
      required this.email,
      required this.fromLogin,
      required this.password})
      : super(key: key);

  @override
  State<ConfirmEmailAddressScreen> createState() =>
      ConfirmEmailAddressController();
}

class ConfirmEmailAddressController extends State<ConfirmEmailAddressScreen> {
  final TextEditingController pinPutController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String pin = "";

  @override
  void initState() {
    globals.stopWatchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      onEnded: () {
        setState(() {});
      },
    );
    globals.stopWatchTimer!.setPresetMinuteTime(1);
    globals.stopWatchTimer!.onStartTimer();

    super.initState();
  }

  resendCode() async {
    if (!globals.stopWatchTimer!.isRunning) {
      setState(() {
        globals.stopWatchTimer!.setPresetMinuteTime(1);
        globals.stopWatchTimer!.onStartTimer();
      });

      final res = await AuthService.sendVerificationCode(
          email: widget.email, cxt: context);
      printData("result", res.statusCode);
      showSnack();
      setState(() {
        //  isLoading = false;
      });
    }
  }

  showSnack() {
    return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("New code sent to your email")));
  }

  getPin(value) {
    setState(() {
      pin = value;
    });
  }

  @override
  void dispose() {
    globals.stopWatchTimer!.dispose();
    super.dispose();
  }

  submit() async {
    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
    });

    final res = await AuthService.verifyEmail(
        password: widget.password,
        pin: pinPutController.text.trim(),
        cxt: context);
    printData("result", res.statusCode);
    if (res.statusCode == 201 || res.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      navigateAndRemoveUntilRoute(context, const MyHomePage());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConfirmEmailAddressView(this);
  }
}
