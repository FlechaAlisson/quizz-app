import 'package:quizz/utils/formater.util.dart';

class CupomModel {
  CupomModel({
    this.storeName,
    this.idHash,
    this.value,
    this.valid,
  });

  String? storeName;
  String? idHash;
  double? value;
  String? valid;

  CupomModel.fromJson(Map<String, dynamic> json) {
    storeName = json['coupon_promotion']['store']['name'];
    idHash = json['code'];
    if (json['coupon_promotion']['abs_discount'] is int) {
      value = (json['coupon_promotion']['abs_discount'] as int).toDouble();
    } else {
      value = (json['coupon_promotion']['percent_discount'] as int).toDouble();
    }
    valid = Formater.formateDate(json['expiry']);
  }
}
