import 'package:cn_admin_panel/core/core_pattern/utils/helper_functions.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../core_pattern/helpers/app_colors.dart';
import '../core_pattern/helpers/app_text.dart';
import '../core_pattern/providers/river_pod/user_riverpod.dart';
import '../core_pattern/responsiveness/responsive.dart';
import '../core_pattern/utils/package_export.dart';
import 'drawer.dart';
import 'events/provider/event_provider.dart';
import 'events/view/all_cn_events.dart';
import 'home/provider/home_provider.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage>
    with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    final provider = ref.read(userProvider);
    provider.getPostData(context);
    provider.userData;
    final eventList = ref.read(eventProvider);
    eventList.getAllCNEvent(context);

    eventList.getAllRandomEvent(context);
    eventList.getAllEventList(context);
    final homeProviders = ref.read(homeProvider);
    homeProviders.getAllAdvert(context);
    homeProviders.getAllCourseApplicant(context);
    tabController = TabController(vsync: this, length: 5);
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(userProvider);
    provider.getPostData(context);
    provider.userData;
    final eventList = ref.read(eventProvider);
    eventList.getAllCNEvent(context);
    eventList.allCNEvent;
    final homeProviders = ref.read(homeProvider);
    homeProviders.getAllAdvert(context);
    homeProviders.getAllCourseApplicant(context);
    homeProviders.courseApplicantModel;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // leading: IconButton(
          //     onPressed: () {
          //       Navigator.pop(context);
          //     },
          //     icon: const Icon(
          //       Icons.arrow_back,
          //       color: AppColors.white,
          //     )),
          title: appText(
              text: "Admin Dashboard",
              textAlign: TextAlign.center,
              fontSize: 20,
              color: AppColors.white,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          actions: [
            DigitalClock(
              is24HourTimeFormat: true,
              hourMinuteDigitTextStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 30,
              ),
              secondDigitTextStyle: const TextStyle(
                color: AppColors.white,
                fontSize: 30,
              ),
              colon: const Text(
                ":",
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
            )
          ],
        ),
        body: Container(
          child: Responsive.isDesktop(context)
              ? Row(
                  children: [
                    Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.pop(context);
                              // navigateToRoute(context, const AccountsPage());
                            },
                            child: UserAccountsDrawerHeader(
                              currentAccountPicture: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  radius: 30.r,
                                  backgroundImage: NetworkImage(
                                      provider.userData.imagePath.toString())),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0.0),
                                color: AppColors.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x25000000),
                                    offset: Offset(4, 3),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              accountName: appText(
                                  text:
                                      "${provider.userData.firstName.toString()} ${provider.userData.surName.toString()}",
                                  textAlign: TextAlign.center,
                                  fontSize: 5.sp,
                                  color: AppColors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                              accountEmail: appText(
                                  text: provider.userData.staffCode.toString(),
                                  textAlign: TextAlign.center,
                                  fontSize: 5.sp,
                                  color: AppColors.white,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          DrawerListTile(
                            title: "Home",
                            color: tabController.index == 0
                                ? AppColors.primary
                                : AppColors.grey,
                            svgSrc: Icon(
                              Icons.account_box,
                              size: 20,
                              color: tabController.index == 0
                                  ? AppColors.primary
                                  : AppColors.grey,
                            ),
                            press: () {
                              tabController.animateTo(0);
                            },
                          ),
                          DrawerListTile(
                            title: "Draw Ticket View",
                            color: tabController.index == 1
                                ? AppColors.primary
                                : AppColors.grey,
                            svgSrc: Icon(
                              Icons.monetization_on,
                              size: 20,
                              color: tabController.index == 1
                                  ? AppColors.primary
                                  : AppColors.grey,
                            ),
                            press: () {
                              tabController.animateTo(1);
                            },
                          ),
                          DrawerListTile(
                            title: "Events View",
                            color: tabController.index == 2
                                ? AppColors.primary
                                : AppColors.grey,
                            svgSrc: Icon(
                              Icons.draw,
                              size: 20,
                              color: tabController.index == 2
                                  ? AppColors.primary
                                  : AppColors.grey,
                            ),
                            press: () {
                              tabController.animateTo(2);
                            },
                          ),
                          DrawerListTile(
                            title: "Voting  View",
                            color: tabController.index == 3
                                ? AppColors.primary
                                : AppColors.grey,
                            svgSrc: Icon(
                              Icons.calendar_month,
                              size: 20,
                              color: tabController.index == 3
                                  ? AppColors.primary
                                  : AppColors.grey,
                            ),
                            press: () {
                              tabController.animateTo(3);
                            },
                          ),
                          DrawerListTile(
                            title: "Tour Guide",
                            color: tabController.index == 4
                                ? AppColors.primary
                                : AppColors.grey,
                            svgSrc: Icon(
                              Icons.monetization_on,
                              size: 20,
                              color: tabController.index == 4
                                  ? AppColors.primary
                                  : AppColors.grey,
                            ),
                            press: () {
                              tabController.animateTo(4);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      // It takes 5/6 part of the screen
                      flex: 5,
                      child: TabBarView(
                        controller: tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                              color: AppColors.white,
                              child: GridView.count(
                                primary: false,
                                padding: const EdgeInsets.all(10),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 6,
                                childAspectRatio: 0.9,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      eventList.getAllCNEvent(context);

                                      eventList.allCNEvent;
                                      navigateToRoute(
                                          context,
                                          AllCNEventPage(
                                            allEvent: eventList.allCNEvent,
                                          ));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[400],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.calendar_today,
                                                size: 40,
                                                color: AppColors.white),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text: "CN Events",
                                                textAlign: TextAlign.center,
                                                fontSize: 5.sp,
                                                color: AppColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      homeProviders
                                          .getAllCourseApplicant(context);
                                      homeProviders.courseApplicantModel;
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[600],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.account_box,
                                                size: 40, color: Colors.white),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text:
                                                    "CNT TechLite Applications",
                                                textAlign: TextAlign.center,
                                                fontSize: 5.sp,
                                                color: AppColors.white,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[200],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.add_circle,
                                                size: 40, color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text: "Retailer's List",
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                color: AppColors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[300],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.draw,
                                                size: 40, color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text: "Draw Tickets",
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                color: AppColors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[400],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.calendar_today,
                                                size: 40, color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text: "Events List",
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                color: AppColors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[500],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.travel_explore,
                                                size: 40, color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text: "Travel's Tickets",
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                color: AppColors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[600],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.upload_file,
                                                size: 40, color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text: "Other Uploads",
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                color: AppColors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      color: Colors.teal[600],
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.schedule,
                                                size: 40, color: Colors.black),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            appText(
                                                text: "Draw Schedule",
                                                textAlign: TextAlign.center,
                                                fontSize: 20,
                                                color: AppColors.black,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
                    ),
                    const Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenu(),
                    ),
                  ],
                )
              : Responsive.isTablet(context)
                  ? Container()
                  : Container(),
        ));
  }
}
