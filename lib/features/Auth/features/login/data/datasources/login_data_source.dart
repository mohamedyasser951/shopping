import 'dart:convert';
import 'package:shopping/features/Auth/features/login/data/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginDataSource {
  Future<LoginModel> userLogin({
    required String name,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "username": 'emilys',
      "password": 'emilyspass',
      // "expiresInMins": 30,
    };
    var response = await http.post(
        Uri.parse('https://dummyjson.com/auth/login'),
        body: body);
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print(decodedData);
      return LoginModel.fromJson(decodedData);
    } else {
      throw Exception("Something Error When Login..");
    }
  }
}

// fetch('https://dummyjson.com/auth/login', {
//   method: 'POST',
//   headers: { 'Content-Type': 'application/json' },
//   body: JSON.stringify({
    
//     username: 'emilys',
//     password: 'emilyspass',
//     expiresInMins: 30, // optional, defaults to 60
//   })
// })
// .then(res => res.json())
// .then(console.log);