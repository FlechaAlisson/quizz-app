import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quizz/model/question.model.dart';
import 'package:quizz/repositories/form.repository.dart';

class QuestionController extends ChangeNotifier {
  final List<QuestionModel> _listQuestions = <QuestionModel>[];
  final FormRepository _repository = FormRepository();

  List<QuestionModel>? get listQuestions => _listQuestions;

  int currentQuestion = 1;

  void nextQuestion() {
    if (_listQuestions.length > currentQuestion) {
      if (_listQuestions[currentQuestion - 1].answer != -1) {
        currentQuestion++;
        notifyListeners();
      }
    }
  }

  void loadSurvey() async {
    currentQuestion = 1;
    _listQuestions.clear();

    Response? response = await _repository.loadForm();

    for (dynamic element in response?.data[0]['form_question']) {
      _listQuestions.add(QuestionModel.fromJson(
          element, response?.data[0]["coupon_promotion"]['id']));
    }

    notifyListeners();
  }

  Future<void> postSurvey(String userId) async =>
      _repository.postSurvey(toJson(userId));

  void optionChosen(int indexQuestion, int indexOption) {
    _listQuestions[indexQuestion].answer = indexOption;
    notifyListeners();
  }

  answer(int index) {
    if (listQuestions?[currentQuestion - 1].answer == index) {
      listQuestions?[currentQuestion - 1].answer = -1;
    } else {
      listQuestions?[currentQuestion - 1].answer = index;
    }
    notifyListeners();
  }

  bool isLastQuestion() => currentQuestion == listQuestions?.length;

  toJson(String userId) {
    Map<String, dynamic> json = {};

    List<Map<String, dynamic>> aux = [];

    for (QuestionModel element in _listQuestions) {
      aux.add({'question_id': element.id, 'answer': element.answer});
    }

    json["form_id"] = _listQuestions[0].idForm;
    json["promotion_id"] = _listQuestions[0].promotionId;
    json["user_id"] = userId;
    json["answers"] = aux;

    return json;
  }
}
