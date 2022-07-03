import 'package:flutter/material.dart';
import 'package:quizz/model/answer.model.dart';
import 'package:quizz/model/question.model.dart';

class QuestionController extends ChangeNotifier {
  final List<QuestionModel> _listQuestions = <QuestionModel>[];

  List<QuestionModel>? get listQuestions => _listQuestions;

  int currentQuestion = 1;

  void loadSurvey() {
    _listQuestions.add(
      QuestionModel(
        question: 'Você gosta de pãoooooooooooo?',
        options: <OptionModel>[
          OptionModel(option: 'Gosto muito'),
          OptionModel(option: 'Gosto'),
          OptionModel(option: 'Neutro'),
          OptionModel(option: 'Odeio'),
          OptionModel(option: 'Odeio muito'),
        ],
      ),
    );

    notifyListeners();
  }

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
}
