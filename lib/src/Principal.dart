import 'package:flutter/material.dart';
import 'package:food_application/constant.dart';
import 'package:food_application/screens/log.dart';

class ParicipalHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "LoginApp",
      theme: ThemeData(
        accentColor: Colors.orange,
        primarySwatch: Colors.blue,
      ),
      home: LogInScreen(),
      
    );
  }
}