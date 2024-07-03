part of 'home_bloc_bloc.dart';

enum Status { loading, success, error }

class HomeStates extends Equatable {
  final Status status;
  final List<Products> products;
  final bool hasReashedMax;
  final String errorMessage;

  const HomeStates(
      {this.status = Status.loading,
      this.products = const [],
      this.hasReashedMax = false,
      this.errorMessage = ''});

  HomeStates copyWith({
    Status? status,
    List<Products>? products,
    bool? hasReashedMax,
    String? errorMessage,
  }) {
    return HomeStates(
      status: status ?? this.status,
      products: products ?? this.products,
      hasReashedMax: hasReashedMax ?? this.hasReashedMax,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, products, hasReashedMax, errorMessage];
}
