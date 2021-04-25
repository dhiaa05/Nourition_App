import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:food_application/screens/services/dio.dart';

class Auth extends ChangeNotifier {
  bool _isLoggIn = false;

  bool get authticated => _isLoggIn;

  void login({Map creds}) async {
    print(creds);
    print("Training....");

    Dio.Response response = await dio().post('/sanctum/token', data: creds);
    print(response.data.toString());
    _isLoggIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggIn = false;
    notifyListeners();
  }
}
