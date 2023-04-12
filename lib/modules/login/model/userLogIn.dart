import 'package:json_annotation/json_annotation.dart';
part 'userLogIn.g.dart';

@JsonSerializable()
class UserPreSignInModel {
  String? email;
  String? password;

  UserPreSignInModel({
    this.email,
    this.password,
  });

  factory UserPreSignInModel.fromJson(Map<String, dynamic> json) {
    return _$UserPreSignInModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserPreSignInModelToJson(this);
}