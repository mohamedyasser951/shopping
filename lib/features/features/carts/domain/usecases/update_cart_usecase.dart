import 'package:dartz/dartz.dart';
import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/cart_model.dart';
import 'package:shopping/features/features/carts/domain/repositories/cart_repository.dart';

class UpdateCartUsecase {
  CartRepository cartRepository;
  UpdateCartUsecase({
    required this.cartRepository,
  });
  Future<Either<Failure, CartModel>> call(
      {required int producId, required int quanity}) async {
    return await cartRepository.updateCart(
        producId: producId, quanity: quanity);
  }
}
