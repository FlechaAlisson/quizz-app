import 'package:quizz/model/answer.model.dart';

class QuestionModel {
  QuestionModel({this.question, this.options});

  String? question;
  List<OptionModel>? options;
  int? answer;
}
