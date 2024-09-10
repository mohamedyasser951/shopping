import 'package:shopping/features/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel(
      {super.id,
      super.username,
      super.email,
      super.firstName,
      super.lastName,
      super.gender,
      super.image,
      super.token,
      super.refreshToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json['id'] as int?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        gender: json['gender'] as String?,
        image: json['image'] as String?,
        token: json['token'] as String?,
        refreshToken: json['refreshToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'image': image,
        'token': token,
        'refreshToken': refreshToken,
      };
}
