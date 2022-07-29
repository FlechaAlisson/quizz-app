import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quizz/utils/dio_client.dart';

class CupomRepository {
  final DioClient _dioClient = DioClient();

  Future<Response?> loadCupom(String userId) async {
    debugPrint('REQUESTO ON coupons');
    return await _dioClient.get('/coupons/$userId');
  }
}
