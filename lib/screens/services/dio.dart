import 'package:dio/dio.dart';

Dio dio() {
  Dio dio = new Dio();

  dio.options.baseUrl = "http://localhost:8000/api";

  dio.options.headers['accept'] = 'Application/Json';

  return dio;
}
