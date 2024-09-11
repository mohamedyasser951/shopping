import 'dart:convert';
import 'package:shopping/Config/Error/exception.dart';
import 'package:shopping/features/Auth/login/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginDataSource {
  Future<LoginModel> userLogin({
    required String name,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      // "username": 'emilys',
      // "password": 'emilyspass',
      "username": name,
      "password": password,
      // "expiresInMins": 30,
    };
    var response = await http
        .post(Uri.parse('https://dummyjson.com/auth/login'), body: body);
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      return LoginModel.fromJson(decodedData);
    } else {
      throw ServerException();
    }
  }
}
