import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  UserModel({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);


  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String emailVerifiedAt;
  late final String createdAt;
  late final String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);


  Map<String, dynamic> toJson() => _$UserToJson(this);
}