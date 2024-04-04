import 'package:dio/dio.dart';

class DioBase {
  static Dio dioWithBaseOptionGetData() {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/forecast?q=Hanoi&appid=';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );
    return dio;
  }

  static Dio dioWithBaseOptionGetData1() {
    String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=21.028511&lon=105.804817&appid=';
    final dio = Dio(
      BaseOptions(baseUrl: apiUrl, connectTimeout: const Duration(seconds: 10)),
    );
    return dio;
  }
}
