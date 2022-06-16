import 'package:hive/hive.dart';

part 'user.model.g.dart';

@HiveType(typeId: 0)
class UserModel extends HiveObject {
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
}
