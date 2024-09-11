import 'package:dartz/dartz.dart';

import 'package:shopping/Config/Error/failures.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/cart_model.dart';
import 'package:shopping/features/features/carts/domain/repositories/cart_repository.dart';

class GetAllCartsUsecase {
  CartRepository cartRepository;
  GetAllCartsUsecase({
    required this.cartRepository,
  });
  Future<Either<Failure, CartModel>> call() async {
    
    return await cartRepository.getAllCarts();
  }
}
