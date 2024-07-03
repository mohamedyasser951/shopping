import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping/features/Home/DataLayer/product_model/product_model.dart';

class RemoteDataSource {
  Future<ProductModel> getAllProducts({int limit = 10, int step = 0}) async {
    var response = await http.get(
        Uri.parse("https://dummyjson.com/products?limit$limit&skip=$step"));
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      print(decodedData);
      return ProductModel.fromJson(decodedData);
    } else {
      throw Exception("Something went Wrong");
    }
  }
}
