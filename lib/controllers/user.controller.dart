import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizz/model/cupom.model.dart';
import 'package:quizz/model/user/user.model.dart';
import 'package:quizz/repositories/user.repository.dart';

class UserController extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  UserModel? data;
  List<CupomModel>? cupomList = <CupomModel>[];

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

  void loadCupons() {
    cupomList?.add(
      CupomModel(
        storeName: "Little Chico",
        idHash: "ASDF-1234-BLABLA",
        value: 30,
        valid: '12/12/2022',
      ),
    );

    cupomList?.add(
      CupomModel(
        storeName: "Casas Bahiie",
        idHash: "ASDF-1234-BLABLA",
        value: 45,
        valid: '21/08/2022',
      ),
    );

    notifyListeners();
  }
}
