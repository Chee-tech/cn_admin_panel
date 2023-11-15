import 'package:cn_admin_panel/core/core_pattern/routes/route.dart';

import '../../features/auth/controller/login_controller.dart';
import '../../features/auth/controller/onboarding_controller.dart';
import '../../features/auth/view/get_started.dart';
import '../../features/home.dart';
import '../helpers/globals.dart';
import '../utils/package_export.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    //Splash screen
    // case RootRoutes.initial:
    //   return MaterialPageRoute(builder: (context) => const OnboardScreen());
    case RootRoutes.onboard:
      return MaterialPageRoute(builder: (context) => const OnboardingScreen());

    // case RootRoutes.phoneNumber:
    //   return MaterialPageRoute(builder: (context) => const PhoneNumberScreen());
    case RootRoutes.login:
      return MaterialPageRoute(builder: (context) => const LoginScreens());
    case RootRoutes.getStarted:
      return MaterialPageRoute(builder: (context) => const GetStartedScreen());
    case RootRoutes.tab:
      return MaterialPageRoute(builder: (context) => const MyHomePage());

    default:
      {
        return _errorRoute();
      }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Page not found!'),
      ),
    );
  });
}

Future<String> initialRoute() async {
  // printData("userId", globals.user!.id);
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // var userToken = await getFromLocalStorage(name: token);
  // int? isviewed = prefs.getInt('onBoard');
  return globals.token!.isEmpty ? RootRoutes.login : RootRoutes.tab;
}
