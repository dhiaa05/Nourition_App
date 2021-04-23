import 'package:flutter/material.dart';
import 'package:food_application/screens/home/component/body.dart';

class Dinner extends StatefulWidget {
  @override
  _DinnerState createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Body()),
      
    );
  }
}