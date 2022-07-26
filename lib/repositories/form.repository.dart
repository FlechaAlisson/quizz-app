import 'package:dio/dio.dart';
import 'package:quizz/utils/dio_client.dart';

class FormRepository {
  final DioClient _dioClient = DioClient();

  Future<Response?> loadForm() async => await _dioClient.get('/forms/');

  void postSurvey(dynamic data) async {
    try {
      dynamic response = await _dioClient.post('/form/response', data);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
