import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isLoggIn = false;

  bool get authticated => _isLoggIn;


}
