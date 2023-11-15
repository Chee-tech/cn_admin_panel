import 'dart:async';
import 'package:cn_admin_panel/core/features/auth/view/onboarding_.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core_pattern/model/onbaording_data.dart';
import '../../../core_pattern/model/onboarding_model.dart';
import '../../../core_pattern/utils/package_export.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);
  static const String routeName = "/Onboard";
  @override
  State<OnboardingScreen> createState() => OnboardingScreenController();
}

class OnboardingScreenController extends State<OnboardingScreen> {
  late PageController pageController;
  int currentIndex = 0;
  // List<String> title = [title_1, title_2, title_3];
  // List<String> subtitle = [subtitle_1, subtitle_2, subtitle_3];
  // List<String> images = [onboard_1, onboard_2, onboard_3];
  Timer? timer;
  List<OnboardingModel> onboardingList = [];
  nextPage() {
    if (currentIndex < 2) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }

    pageController.animateToPage(
      currentIndex,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
    // // if (currentIndex == 3) {
    // //   return null;
    // // } else {
    // pageController.animateToPage(
    //   currentIndex++,
    //   duration: const Duration(milliseconds: 500),
    //   curve: Curves.easeIn,
    // );
    // // }
  }

  storeOnboardInfo() async {
    //  print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    // print(prefs.getInt('onBoard'));
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex < 2) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }

      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();
      });
    });
    super.initState();
    setState(() {
      onboardingList = formattedOnboardingList;
    });
  }

// onPageChanged(){
//     setState(() {
//                  currentIndex
//                   });
// }
  @override
  void dispose() {
    pageController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingView(this);
  }
}
