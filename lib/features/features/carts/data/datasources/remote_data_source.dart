import 'dart:convert';

import 'package:shopping/Config/Error/exception.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/cart_model.dart';
import 'package:http/http.dart' as http;

abstract class CartRemoteDataSource {
  Future<CartModel> getAllCartRemoteDataSource();
  Future<CartModel> addCartRemoteDataSource({
    required int producId,
    required int quanity,
  });
  Future<CartModel> updateCartRemoteDataSource({
    required int producId,
    required int quanity,
  });
  Future<CartModel> deleteCartRemoteDataSource({
    required int producId,
  });
}

class RemoteDataSourceImplem implements CartRemoteDataSource {
  @override
  Future<CartModel> getAllCartRemoteDataSource() async {
    var response =
        await http.get(Uri.parse("https://dummyjson.com/carts/1"));
    if (response.statusCode == 200) {
      var decodedData = json.decode(response.body);
      return CartModel.fromJson(decodedData);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CartModel> deleteCartRemoteDataSource({required int producId}) {
    // TODO: implement deleteCartRemoteDataSource
    throw UnimplementedError();
  }

  @override
  Future<CartModel> updateCartRemoteDataSource(
      {required int producId, required int quanity}) {
    // TODO: implement updateCartRemoteDataSource
    throw UnimplementedError();
  }

  @override
  Future<CartModel> addCartRemoteDataSource(
      {required int producId, required int quanity}) {
    // TODO: implement addCartRemoteDataSource
    throw UnimplementedError();
  }
}
