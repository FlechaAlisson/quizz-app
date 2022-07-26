import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'user.model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject with ChangeNotifier {
  UserModel({
    this.name,
    this.email,
    this.id,
    this.photoUrl,
  });

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? id;

  @HiveField(3)
  String? photoUrl;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['name'] = name;
    json['email'] = email;
    json['id'] = id;
    json['password'] = '';

    return json;
  }
}
