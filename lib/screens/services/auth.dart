import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  bool _isLoggIn = false;

  bool get authticated => _isLoggIn;

  void login(Map creds) {
    _isLoggIn = true;
    notifyListeners(); 
  }

  void logout() {
    _isLoggIn = false;
    notifyListeners();
  }
}
