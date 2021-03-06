import 'package:flutter/material.dart';
import 'package:food_application/constant.dart';
import 'package:food_application/screens/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController.text = "dhiaa@gmail.com";
    _passwordController.text = "19950506";

        super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) =>
                  value.isEmpty ? 'please entrie your email Address' : null,
            ),
            TextFormField(
              
              controller: _passwordController,
              validator: (value) =>
                  value.isEmpty ? 'please entrie your password' : null,
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
              minWidth: double.infinity,
              color: kPrimaryColor,
              child: Text(
                "login",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Map creds = {
                  'email': _emailController.text,
                  'password': _passwordController.text,
                  'device_name': 'mobile'
                };
                if (_formkey.currentState.validate()) {
                  Provider.of<Auth>(context, listen: false).login(creds: creds);
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
