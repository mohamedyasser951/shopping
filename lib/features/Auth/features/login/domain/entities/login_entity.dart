import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? token;
  final String? refreshToken;

  const LoginEntity({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
    this.token,
    this.refreshToken,
  });

  @override
  List<Object?> get props {
    return [
      id,
      username,
      email,
      firstName,
      lastName,
      gender,
      image,
      token,
      refreshToken,
    ];
  }
}
