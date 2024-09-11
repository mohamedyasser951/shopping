part of 'carts_bloc.dart';

abstract class CartsEvent extends Equatable {
  const CartsEvent();

  @override
  List<Object> get props => [];
}

class GetAllCartsEvent extends CartsEvent {}

class AddCartEvent extends CartsEvent {
  final int producId;
  final int quanity;

  const AddCartEvent({
    required this.producId,
    required this.quanity,
  });

  @override
  List<Object> get props => [producId, quanity];
}

class UpdateCartEvent extends CartsEvent {
  final int producId;
  final int quanity;

  const UpdateCartEvent({
    required this.producId,
    required this.quanity,
  });

  @override
  List<Object> get props => [producId, quanity];
}

class DeleteCartEvent extends CartsEvent {
  final int producId;

  const DeleteCartEvent({
    required this.producId,
  });

  @override
  List<Object> get props => [producId];
}
