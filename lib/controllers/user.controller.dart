import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizz/model/user/user.model.dart';
import 'package:quizz/repositories/user.repository.dart';

class UserController extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  UserModel? data;

  Future googleLogin() async {
    final userAux = await googleSignIn.signIn();

    if (userAux == null) return;

    data = UserModel(
      name: userAux.displayName,
      email: userAux.email,
      id: userAux.id,
      photoUrl: userAux.photoUrl,
    );

    saveUserData(data!);

    notifyListeners();
  }

  void saveUserData(UserModel user) => UserRepository.saveUserData(user);
  void clearUserData() => UserRepository.clearUserData();
  UserModel? getUserData() {
    data = UserRepository.getUserData();
    return data;
  }
}
