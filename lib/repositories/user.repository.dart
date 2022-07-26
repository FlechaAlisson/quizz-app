import 'package:hive/hive.dart';
import 'package:quizz/model/user/user.model.dart';
import 'package:quizz/utils/dio_client.dart';

class UserRepository {
  final DioClient _dio = DioClient();

  static saveUserData(UserModel data) {
    var userBox = Hive.box<UserModel>('user');
    userBox.put('user', data);
  }

  static clearUserData() {
    var userBox = Hive.box<UserModel>('user');
    userBox.clear();
  }

  static getUserData() {
    var userBox = Hive.box<UserModel>('user');

    return userBox.get('user');
  }

  void registerUser(UserModel data) async => _dio.post('/user', data.toJson());
}
