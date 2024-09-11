part of 'carts_bloc.dart';

abstract class CartsState {
  const CartsState();
}

class CartsInitial extends CartsState {}

class CartsLoadingState extends CartsState {}

class CartsLoadedState extends CartsState {
   CartModel carts;
   CartsLoadedState({
    required this.carts,
  });
}

class CartsErrorState extends CartsState {
  final String error;
  const CartsErrorState({
    required this.error,
  });
}
