import 'package:dio/dio.dart';

class ApiClient {
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  // ignore: unused_field
  static const apiKey = '304cbb5d6d9186e9db6a041efb642378';

  final dio = createDio();

  static Dio createDio() {
    var dio = Dio(BaseOptions(baseUrl: _baseUrl));

    return dio;
  }

  ApiClient._internal();

  static final _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;
}
