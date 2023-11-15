import 'package:cn_admin_panel/core/core_pattern/utils/colors.dart';
import '../../../core_pattern/responsiveness/responsive.dart';
import '../../../core_pattern/routes/route.dart';
import '../../../core_pattern/utils/app_buttons.dart';
import '../../../core_pattern/utils/helper_functions.dart';
import '../../../core_pattern/utils/package_export.dart';
import '../../../core_pattern/utils/typography.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive.isDesktop(context)
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
                  // It takes 5/6 part of the screen
                  flex: 5,
                  child: Container(
                    //padding: EdgeInsets.all(24.sp),
                    decoration: const BoxDecoration(
                        //  color: AppColors.primaryDark,
                        image: DecorationImage(
                            image: AssetImage("assets/images/doodle.png"))),
                    height: getScreenHeight(context),
                    width: getScreenWidth(context),
                    child: Stack(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(24.sp),
                          decoration: const BoxDecoration(
                            color: AppColors.primaryDark,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                            image: DecorationImage(
                                image: AssetImage("assets/images/doodle.png"),
                                fit: BoxFit.cover),
                          ),
                          height: 310.h,
                          width: getScreenWidth(context),
                        ),
                        //const SizedBox(),
                        Positioned(
                          top: 230.h,
                          left: 135.w,
                          //  alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 70.r,
                            child: Image.asset(
                              "assets/images/logoo.png",
                              fit: BoxFit.contain,
                              height: 100.h,
                              width: 200.w,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              addVerticalSpacing(48.h),
                              Image.asset(
                                "assets/images/logoo.png",
                                height: 50.h,
                                width: 100.w,
                              ),
                              addVerticalSpacing(15.h),
                              Text(
                                "Changing the narrative of the Lottery Business in Africa",
                                style: AppTypography.buttonSmall().copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Button(
                                  text: "Login",
                                  onPressed: () {
                                    navPush(context, RootRoutes.login);
                                  },
                                  textcolor: AppColors.white,
                                  btncolor: AppColors.primaryDark,
                                ),
                                addVerticalSpacing(20.h),
                                ButtonSO(
                                  borderColor: AppColors.primary,
                                  text: "Register",
                                  onPressed: () {
                                    navPush(context, RootRoutes.createAccount);
                                  },
                                  textcolor: AppColors.primaryDark,
                                  btncolor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
          : Container(
              //padding: EdgeInsets.all(24.sp),
              decoration: const BoxDecoration(
                  //  color: AppColors.primaryDark,
                  image: DecorationImage(
                      image: AssetImage("assets/images/doodle.png"))),
              height: getScreenHeight(context),
              width: getScreenWidth(context),
              child: Stack(
                //   mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(24.sp),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryDark,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                      image: DecorationImage(
                          image: AssetImage("assets/images/doodle.png"),
                          fit: BoxFit.cover),
                    ),
                    height: 310.h,
                    width: getScreenWidth(context),
                  ),
                  //const SizedBox(),
                  Positioned(
                    top: 230.h,
                    left: 135.w,
                    //  alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70.r,
                      child: Image.asset(
                        "assets/images/logoo.png",
                        fit: BoxFit.contain,
                        height: 100.h,
                        width: 200.w,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        addVerticalSpacing(48.h),
                        Image.asset(
                          "assets/images/logoo.png",
                          height: 50.h,
                          width: 100.w,
                        ),
                        addVerticalSpacing(15.h),
                        Text(
                          "Changing the narrative of the Lottery Business in Africa",
                          style: AppTypography.buttonSmall().copyWith(
                              fontWeight: FontWeight.w500, fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Button(
                            text: "Login",
                            onPressed: () {
                              navPush(context, RootRoutes.login);
                            },
                            textcolor: AppColors.white,
                            btncolor: AppColors.primaryDark,
                          ),
                          addVerticalSpacing(20.h),
                          ButtonSO(
                            borderColor: AppColors.primary,
                            text: "Register",
                            onPressed: () {
                              navPush(context, RootRoutes.createAccount);
                            },
                            textcolor: AppColors.primaryDark,
                            btncolor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
