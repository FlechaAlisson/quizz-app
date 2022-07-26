import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizz/model/cupom.model.dart';
import 'package:quizz/model/user/user.model.dart';
import 'package:quizz/repositories/cupom.repository.dart';
import 'package:quizz/repositories/user.repository.dart';

class UserController extends ChangeNotifier {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  UserModel? data;
  List<CupomModel>? cupomList = <CupomModel>[];
  final UserRepository _repository = UserRepository();
  final CupomRepository _cupomRepository = CupomRepository();

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

    registerUser(data!);

    notifyListeners();
  }

  void saveUserData(UserModel user) => UserRepository.saveUserData(user);

  void registerUser(UserModel user) => _repository.registerUser(user);

  void clearUserData() => UserRepository.clearUserData();
  UserModel? getUserData() {
    data = UserRepository.getUserData();
    return data;
  }

  Future<void> loadCupons() async {
    Response<dynamic>? response =
        await _cupomRepository.loadCupom(data?.id ?? '');

    for (final dynamic cupom in response?.data) {
      cupomList?.add(CupomModel.fromJson(cupom));
    }

    notifyListeners();
  }
}
