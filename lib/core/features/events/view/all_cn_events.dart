// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:async';

import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../../core_pattern/responsiveness/responsive.dart';
import '../../../core_pattern/utils/colors.dart';
import '../../../core_pattern/utils/helper_functions.dart';
import '../../../core_pattern/utils/package_export.dart';
import '../../../core_pattern/widgets/app_text.dart';

import '../../../core_pattern/widgets/input.dart';
import '../../Events/model/event_model.dart';
import '../../Events/provider/event_provider.dart';
import '../../drawer.dart';

class AllCNEventPage extends ConsumerStatefulWidget {
  const AllCNEventPage({
    required this.allEvent,
    Key? key,
  }) : super(key: key);
  final List<EventModel> allEvent;

  @override
  __AllCNEventPageState createState() => __AllCNEventPageState();
}

class __AllCNEventPageState extends ConsumerState<AllCNEventPage> {
  TextEditingController searchTEC = TextEditingController();
  List<EventModel> filterProducts = [];
  List<EventModel> searchAllEvent = [];
  Timer? timer;
  @override
  void initState() {
    super.initState();
    filterProducts = widget.allEvent;
    final allEvents = ref.read(eventProvider);
    allEvents.getAllCNEvent(context);

    filterProducts = allEvents.allCNEvent;
    setState(() {
      filterProducts = allEvents.allCNEvent;
      searchAllEvent = allEvents.allCNEvent;
    });
    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        allEvents.getAllLoadedCNEvent(context);
        filterProducts = allEvents.allCNEvent;
        setState(() {
          filterProducts = allEvents.allCNEvent;
          searchAllEvent = allEvents.allCNEvent;
        });
      },
    );
  }

  searchProducts(String? search) {
    List<EventModel> searchList = [];
    searchList.addAll(searchAllEvent);
    if (search!.isNotEmpty) {
      List<EventModel> searchResults = [];
      for (var item in searchList) {
        if (item.eventTitle
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase())) {
          searchResults.add(item);
        } else if (item.state
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase())) {
          searchResults.add(item);
        } else if (item.city
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase())) {
          searchResults.add(item);
        } else if (item.location
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase())) {
          searchResults.add(item);
        } else if (item.eventCategories
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase())) {
          searchResults.add(item);
        }
      }
      setState(() {
        filterProducts = searchResults;
      });

      return;
    } else {
      filterProducts = searchAllEvent;
    }
  }

  @override
  Widget build(BuildContext context) {
    final eventList = ref.read(eventProvider);
    eventList.allCNEvent;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
            )),
        title: appText(
            text: "CN Events",
            textAlign: TextAlign.center,
            fontSize: 15,
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
      body: Responsive.isDesktop(context)
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SerachInput(
                          prefix: const Icon(Icons.search,
                              color: AppColors.primary),
                          controller: searchTEC,
                          hintText: "type a name , state or location",
                          labelText: "Search",
                          hintStyleColor: AppColors.black,
                          textColor: AppColors.black,
                          styleColor: AppColors.black,
                          borderColor: AppColors.primary,
                          fillColor: AppColors.white,
                          keyboard: TextInputType.text,
                          onChanged: (String? value) {
                            searchProducts(value!);
                          },
                          validator: (value) {
                            return null;
                          },
                          toggleEye: () {},
                          onSaved: (value) {},
                          onTap: () {},
                        ),
                      ),
                      filterProducts.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: filterProducts.length,
                              itemBuilder: (BuildContext context, int index) {
                                DateTime dt2 = DateTime.parse(
                                    filterProducts[index]
                                        .eventStartDate
                                        .toString());
                                String date =
                                    DateFormat("E, MMM d").format(dt2);
                                return InkWell(
                                  onTap: () {
                                    // events.getEventDetails(
                                    //     context, filterProducts[index].id.toString());
                                    // navigateToRoute(
                                    //     context,
                                    //     EventDetailsPage(
                                    //       event: filterProducts[index],
                                    //     ));
                                  },
                                  child: Card(
                                      clipBehavior: Clip.hardEdge,
                                      child: Container(
                                        color: AppColors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: appText(
                                                  text:
                                                      "${filterProducts[index].eventTitle}",
                                                  textAlign: TextAlign.start,
                                                  fontSize: 4.sp,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: appText(
                                                  text: date,
                                                  textAlign: TextAlign.start,
                                                  fontSize: 3.sp,
                                                  color: AppColors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            SizedBox(height: 20.h),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  const Icon(Icons.location_pin,
                                                      color: AppColors.primary,
                                                      size: 15),
                                                  Expanded(
                                                    child: appText(
                                                        text:
                                                            "${filterProducts[index].location}",
                                                        textAlign:
                                                            TextAlign.start,
                                                        // overflow:
                                                        //     TextOverflow.ellipsis,
                                                        fontSize: 3.sp,
                                                        color: AppColors.black,
                                                        fontStyle:
                                                            FontStyle.normal,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      )),
                                );
                              },
                            )
                          : Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/empty.png",
                                    width: 200.w,
                                    height: 200.h,
                                  ),
                                  addVerticalSpacing(5.h),
                                  appText(
                                      text: "No Event Found",
                                      textAlign: TextAlign.center,
                                      fontSize: 20.sp,
                                      color: AppColors.black,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ),
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
          : filterProducts.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: filterProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        // events.getEventDetails(
                        //     context, filterProducts[index].id.toString());
                        // navigateToRoute(
                        //     context,
                        //     EventDetailsPage(
                        //       event: filterProducts[index],
                        //     ));
                      },
                      child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: Container(
                            color: AppColors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                addVerticalSpacing(10.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    addHorizontalSpacing(5.w),
                                    Container(
                                      height: 155.h,
                                      width: 155.w,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "${filterProducts[index].listEventsImages![0].imagePath}"),
                                          )),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        addVerticalSpacing(10.h),
                                        appText(
                                            text:
                                                "${filterProducts[index].eventTitle}",
                                            textAlign: TextAlign.start,
                                            fontSize: 18.sp,
                                            overflow: TextOverflow.ellipsis,
                                            color: AppColors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold),
                                        SizedBox(height: 20.h),
                                        appText(
                                            text:
                                                "${filterProducts[index].eventStartDate}",
                                            textAlign: TextAlign.start,
                                            fontSize: 15.sp,
                                            color: AppColors.black,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.normal),
                                        SizedBox(height: 20.h),
                                        Row(
                                          children: [
                                            const Icon(Icons.location_pin,
                                                color: AppColors.primary,
                                                size: 15),
                                            Expanded(
                                              child: appText(
                                                  text:
                                                      "${filterProducts[index].location}",
                                                  textAlign: TextAlign.start,
                                                  // overflow:
                                                  //     TextOverflow.ellipsis,
                                                  fontSize: 16.sp,
                                                  color: AppColors.black,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                      ],
                                    )),
                                  ],
                                ),
                                addVerticalSpacing(10.h),
                              ],
                            ),
                          )),
                    );
                  },
                ))
              : Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/empty.png",
                        width: 200.w,
                        height: 200.h,
                      ),
                      addVerticalSpacing(5.h),
                      appText(
                          text: "No Event Found",
                          textAlign: TextAlign.center,
                          fontSize: 20.sp,
                          color: AppColors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
    );
  }
}
