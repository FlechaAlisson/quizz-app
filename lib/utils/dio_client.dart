import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://questionable-api.jesuisjedi.com/',
    ),
  );

  Future<Response?> get(String path) async => await _dio.get(path);

  Future<Response?> post(String path, dynamic data) async => await _dio.post(
        path,
        data: data,
      );
}
