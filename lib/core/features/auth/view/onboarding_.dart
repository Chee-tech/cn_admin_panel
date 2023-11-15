import 'package:cn_admin_panel/core/core_pattern/routes/route.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/app_buttons.dart';
import 'package:cn_admin_panel/core/core_pattern/utils/helper_functions.dart';

import '../../../core_pattern/architecture/mvc.dart';
import '../../../core_pattern/responsiveness/responsive.dart';
import '../../../core_pattern/utils/colors.dart';
import '../../../core_pattern/utils/package_export.dart';
import '../../../core_pattern/utils/typography.dart';
import '../controller/onboarding_controller.dart';

class OnboardingView
    extends StatelessView<OnboardingScreen, OnboardingScreenController> {
  const OnboardingView(OnboardingScreenController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Responsive.isDesktop(context)
            ? Row(
                children: [
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: Container(
                      width: 500,
                      height: getScreenHeight(context),
                      decoration: const BoxDecoration(
                          //  color: AppColors.primaryDark,
                          image: DecorationImage(
                              image: AssetImage("assets/images/doodle.png"))),
                    ),
                  ),
                  Expanded(
                    // It takes
                    child: SizedBox(
                      height: getScreenHeight(context).h,
                      // width: deviceWidth(context).w,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            addVerticalSpacing(20.h),
                            Center(
                              child: Image.asset(
                                "assets/images/logoo.png",
                                height: 100.h,
                              ),
                            ),
                            Expanded(
                              // width: size.width,
                              // height: size.height / 2.3,
                              child: PageView.builder(
                                  controller: controller.pageController,
                                  itemCount: controller.onboardingList.length,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(24.0.sp),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          addVerticalSpacing(51.h),
                                          Image.asset(
                                            controller
                                                .onboardingList[index].image
                                                .toString(),
                                            height: 250.h,
                                            width: double.infinity,
                                          ),
                                          addVerticalSpacing(51.h),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller
                                                    .onboardingList[index].text
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: AppTypography.title(),
                                              ),
                                              addVerticalSpacing(8.h),
                                              Text(
                                                controller
                                                    .onboardingList[index].pre
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: AppTypography.sub1(
                                                    color: AppColors.grey),
                                              ),
                                              addVerticalSpacing(10.h),
                                              SmoothPageIndicator(
                                                controller: controller
                                                    .pageController, // PageController
                                                count: controller
                                                    .onboardingList.length,
                                                effect: ExpandingDotsEffect(
                                                    radius: 10,
                                                    expansionFactor: 5,
                                                    dotColor:
                                                        const Color(0xffC5CAE8),
                                                    activeDotColor:
                                                        AppColors.green,
                                                    dotHeight: 10.h,
                                                    dotWidth: 10
                                                        .w), // your preferred effect
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            addVerticalSpacing(20.h),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16, left: 16, bottom: 20),
                              child: Button(
                                  isLoading: false,
                                  btncolor: AppColors.green,
                                  text: controller.currentIndex == 2
                                      ? "Get Started"
                                      : "Continue",
                                  onPressed: () async {
                                    controller.currentIndex == 2
                                        ? navPush(context, RootRoutes.login)
                                        : controller.nextPage();
                                    await controller.storeOnboardInfo();
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: Container(
                      width: 500,
                      height: getScreenHeight(context),
                    ),
                  ),
                ],
              )
            : SizedBox(
                height: getScreenHeight(context).h,
                // width: deviceWidth(context).w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    addVerticalSpacing(20.h),
                    Center(
                      child: Image.asset(
                        "assets/images/logoo.png",
                        height: 100.h,
                      ),
                    ),
                    Expanded(
                      // width: size.width,
                      // height: size.height / 2.3,
                      child: PageView.builder(
                          controller: controller.pageController,
                          itemCount: controller.onboardingList.length,
                          itemBuilder: (_, index) {
                            return Padding(
                              padding: EdgeInsets.all(24.0.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  addVerticalSpacing(51.h),
                                  Image.asset(
                                    controller.onboardingList[index].image
                                        .toString(),
                                    height: 250.h,
                                    width: double.infinity,
                                  ),
                                  addVerticalSpacing(51.h),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.onboardingList[index].text
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: AppTypography.title(),
                                      ),
                                      addVerticalSpacing(8.h),
                                      Text(
                                        controller.onboardingList[index].pre
                                            .toString(),
                                        textAlign: TextAlign.center,
                                        style: AppTypography.sub1(
                                            color: AppColors.grey),
                                      ),
                                      addVerticalSpacing(40.h),
                                      SmoothPageIndicator(
                                        controller: controller
                                            .pageController, // PageController
                                        count: controller.onboardingList.length,
                                        effect: ExpandingDotsEffect(
                                            radius: 10,
                                            expansionFactor: 5,
                                            dotColor: const Color(0xffC5CAE8),
                                            activeDotColor: AppColors.green,
                                            dotHeight: 10.h,
                                            dotWidth:
                                                10.w), // your preferred effect
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    addVerticalSpacing(50.h),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 16, bottom: 20),
                      child: Button(
                          isLoading: false,
                          btncolor: AppColors.green,
                          text: controller.currentIndex == 2
                              ? "Get Started"
                              : "Continue",
                          onPressed: () async {
                            controller.currentIndex == 2
                                ? navPush(context, RootRoutes.login)
                                : controller.nextPage();
                            await controller.storeOnboardInfo();
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
