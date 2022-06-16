import 'package:hive/hive.dart';
import 'package:quizz/model/user/user.model.dart';

class UserRepository {
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
}
