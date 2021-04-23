import 'package:flutter/material.dart';
import 'package:food_application/screens/home/component/drawer.dart';
import 'component/app_bar.dart';
import 'component/body.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: NavBar(),
      appBar: homeAppBar(context, scaffoldKey),
      body: SingleChildScrollView(child: Body()),
    );
  }
}
