import 'package:dartz/dartz.dart';
import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/cart_model.dart';

abstract class CartRepository {
  Future<Either<Failure, CartModel>> getAllCarts();
  Future<Either<Failure, CartModel>> addCart({
    required int producId,
    required int quanity,
  });
  Future<Either<Failure, CartModel>> updateCart({
    required int producId,
    required int quanity,
  });

  Future<Either<Failure, CartModel>> deleteCart({required int producId});
}
