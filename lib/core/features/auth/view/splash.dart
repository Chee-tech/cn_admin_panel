import 'dart:async';

import '../../../core_pattern/utils/colors.dart';
import '../../../core_pattern/utils/helper_functions.dart';
import '../../../core_pattern/utils/package_export.dart';
import '../controller/onboarding_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getScreenHeight(context),
        width: getScreenWidth(context),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.primary]),
            image: DecorationImage(
                image: AssetImage("assets/images/splash.png"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            addVerticalSpacing(200.h),
            Center(
              child: Image.asset(
                "assets/images/logoo.png",
                height: 50.h,
                width: 100.w,
              ),
            ),
            addVerticalSpacing(200.h),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ));
  }
}
