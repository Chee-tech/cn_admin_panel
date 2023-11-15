// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: SvgPicture.asset(
          "assets/icons/back_arrow.svg",
          height: 20,
          width: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
