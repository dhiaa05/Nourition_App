import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_application/constant.dart';
import 'package:food_application/screens/home/component/drawer.dart';
import 'package:food_application/screens/home/tabScreens/breakFast.dart';
import 'package:food_application/screens/home/tabScreens/dinnerScreen.dart';
import 'package:food_application/screens/home/tabScreens/fruit.dart';
import 'package:food_application/screens/home/tabScreens/salad.dart';
import 'component/app_bar.dart';
import 'component/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 4, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: NavBar(),
      appBar: homeAppBar(context, scaffoldKey, tabController),
      body: new TabBarView(controller: tabController, children: [
        Dinner(),
        BreakFast(),
        Salad(),
        Fruit(),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        color: kTextColor,
        height: 50,
          backgroundColor: kPrimaryColor,
          animationCurve: Curves.easeInOut,
        items: [
          Icon(
            Icons.verified_user,
            size: 20,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 20,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 20,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          debugPrint("Current Index is $index");
        },
      ),
    );
  }
}
