import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:shopping/features/Home/DataLayer/DataSource/remote_data_source.dart';
import 'package:shopping/features/Home/DataLayer/product_model/product_model.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeStates> {
  HomeBloc() : super(const HomeStates()) {
    on<HomeBlocEvent>((event, emit) async {
      if (event is GetAllProducts) {
        try {
          if (state.hasReashedMax) return;
          if (state.status == Status.loading) {
            ProductModel productModel =
                await RemoteDataSource().getAllProducts();
            emit(HomeStates(
                status: Status.success, products: productModel.products!));
          } else {
            ProductModel productModel = await RemoteDataSource()
                .getAllProducts(step: state.products.length);
            productModel.products!.isEmpty
                ? emit(state.copyWith(hasReashedMax: true))
                : emit(state.copyWith(
                    hasReashedMax: false,
                    status: Status.success,
                    products: List.of(state.products)
                      ..addAll(productModel.products!)));
          }
        } catch (e) {
          print(e);
          emit(const HomeStates(
              status: Status.error, errorMessage: "Something wrong...."));
        }
      }
    }, transformer: droppable());
  }
}
