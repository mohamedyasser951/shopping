import 'package:dartz/dartz.dart';

import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/Config/network/internet_checker.dart';
import 'package:shopping/features/features/carts/data/datasources/remote_data_source.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/cart_model.dart';
import 'package:shopping/features/features/carts/domain/repositories/cart_repository.dart';

class CartRepoImplements implements CartRepository {
  CartRemoteDataSource remoteDataSource;
  InternetCheckerImplem internetChecker;
  CartRepoImplements({
    required this.remoteDataSource,
    required this.internetChecker,
  });
  @override
  Future<Either<Failure, CartModel>> getAllCarts() async {
    if (await internetChecker.isConnected) {
      try {
        CartModel allCarts =
            await remoteDataSource.getAllCartRemoteDataSource();
        return Right(allCarts);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, CartModel>> addCart(
      {required int producId, required int quanity}) {
    // TODO: implement addCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartModel>> deleteCart({required int producId}) {
    // TODO: implement deleteCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CartModel>> updateCart(
      {required int producId, required int quanity}) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }
}
