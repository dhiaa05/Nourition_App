import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_application/constant.dart';

AppBar homeAppBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () => key.currentState.openDrawer(),
    ),
    title: RichText(
      text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: "Healthy", style: TextStyle(color: ksecondaryKey)),
            TextSpan(text: "Food", style: TextStyle(color: kPrimaryColor))
          ]),
    ),
    actions: <Widget>[
      IconButton(
          icon: SvgPicture.asset(
            "assets/icons/notification.svg",
          ),
          onPressed: () {})
    ],
    bottom: new TabBar(tabs: 
    [
      new Tab(text: "Dinner",),
      new Tab(text: "Berakfast",),
      new Tab(text: "Sallad",),
      new Tab(text: "Fruits",),
    ]),
  );
}
