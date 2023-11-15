import 'package:flutter/material.dart';
import '../core_pattern/helpers/endpoints.dart';
import '../core_pattern/helpers/helper_functions.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset(
              "assets/images/logoo.png",
              height: 100,
              width: 100,
            ),
          ),
          DrawerListTile(
            title: "Users List",
            svgSrc:
                const Icon(Icons.account_box, size: 20, color: Colors.black),
            press: () {
              // navigateToRoute(
              //     context,
              //     MyHomePage(
              //       url: Endpoints.uniFeeTicketNoUrl,
              //       soldUrl: Endpoints.uniFeeTicketSalesUrl,
              //       name: "UniFee Tickets",
              //     ));
            },
          ),
          DrawerListTile(
            title: "Retailers List",
            svgSrc: const Icon(Icons.monetization_on,
                size: 20, color: Colors.black),
            press: () {
              // navigateToRoute(
              //     context,
              //     MyHomePage(
              //       url: Endpoints.billAndTicketNoUrl,
              //       soldUrl: Endpoints.billsAndFoodTicketSalesUrl,
              //       name: "Chop & Chill Tickets",
              //     ));
            },
          ),
          DrawerListTile(
            title: "Draw Tickets List",
            svgSrc: const Icon(Icons.draw, size: 20, color: Colors.black),
            press: () {},
          ),
          DrawerListTile(
            title: "Events Tickets List",
            svgSrc:
                const Icon(Icons.calendar_month, size: 20, color: Colors.black),
            press: () {},
          ),
          DrawerListTile(
            title: "Travels Tickets",
            svgSrc: const Icon(Icons.monetization_on,
                size: 20, color: Colors.black),
            press: () {},
          ),
          DrawerListTile(
            title: "Other Uploads",
            svgSrc:
                const Icon(Icons.upload_file, size: 20, color: Colors.black),
            press: () {},
          ),
          DrawerListTile(
            title: "Contact Us",
            svgSrc: const Icon(Icons.abc, size: 20, color: Colors.black),
            press: () {},
          ),
          DrawerListTile(
            title: "Feedback",
            svgSrc: const Icon(
              Icons.feedback,
              size: 20,
              color: Colors.black,
            ),
            press: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    this.color,
  }) : super(key: key);

  final String title;
  final Widget svgSrc;
  final VoidCallback press;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Container(
        color: Colors.white,
        child: svgSrc,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
            color: color ?? Colors.black),
      ),
    );
  }
}
