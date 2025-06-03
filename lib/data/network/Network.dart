import 'package:dio/dio.dart';

class Network {
  final Dio dio;

  Network()
      : dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.sampleapis.com/coffee/',
      headers: {'Content-Type': 'application/json'},
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    ),
  );
}