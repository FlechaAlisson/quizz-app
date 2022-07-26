import 'package:quizz/model/answer.model.dart';

class QuestionModel {
  QuestionModel({this.question, this.options});

  String? question;
  String? promotionId;
  List<OptionModel>? options = [];
  int? id;
  int? idForm;
  int? answer = -1;

  QuestionModel.fromJson(Map<String, dynamic> json, dynamic coupon_promotion) {
    question = json['inquiry'];
    id = json['id'];
    idForm = json['id_form'];
    promotionId = coupon_promotion;

    for (dynamic element in json['options']) {
      options?.add(OptionModel(option: element));
    }
  }
}
