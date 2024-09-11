import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/cart_model.dart';
import 'package:shopping/features/features/carts/domain/usecases/get_all_carts_usecase.dart';
part 'carts_event.dart';
part 'carts_state.dart';

class CartsBloc extends Bloc<CartsEvent, CartsState> {
  GetAllCartsUsecase getAllCartsUsecase;
  CartsBloc({
    required this.getAllCartsUsecase,
  }) : super(CartsInitial()) {
    on<CartsEvent>((event, emit) async {
      if (event is GetAllCartsEvent) {
        emit(CartsLoadingState());
        final failureOrData = await getAllCartsUsecase();
        failureOrData.fold((failuer) {
          emit(const CartsErrorState(error: "Failed to load cart items"));
        }, (data) {
          emit(CartsLoadedState(carts: data));
        });
      }
    });
  }
}
