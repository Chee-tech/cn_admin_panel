import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../core_pattern/helpers/app_colors.dart';
import '../core_pattern/helpers/app_text.dart';
import '../core_pattern/responsiveness/responsive.dart';
import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
                    const Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenu(),
                    ),
                    Expanded(
                      // It takes 5/6 part of the screen
                      flex: 5,
                      child: Container(
                          color: AppColors.white,
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(10),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 6,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.teal[100],
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.account_box,
                                            size: 40, color: Colors.black),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        appText(
                                            text: "User's List",
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
                                            text: "CN Events",
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
