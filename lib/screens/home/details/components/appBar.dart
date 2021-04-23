import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () {},
    ),
    actions: [
      IconButton(
          icon: SvgPicture.asset("assets/icons/share.svg"), onPressed: () {}),
      IconButton(
          icon: SvgPicture.asset("assets/icons/more.svg"), onPressed: () {})
    ],
  );
}
