import 'package:dio/dio.dart';
import 'package:quizz/utils/dio_client.dart';

class CupomRepository {
  final DioClient _dioClient = DioClient();

  Future<Response?> loadCupom(String userId) async =>
      await _dioClient.get('/coupons/$userId');
}
