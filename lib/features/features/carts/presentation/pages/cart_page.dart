import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/features/features/carts/presentation/bloc/carts_bloc.dart';
import 'package:shopping/features/features/carts/presentation/widgets/bottom_checkout_button.dart';
import 'package:shopping/features/features/carts/presentation/widgets/cart_loadded_builder.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<CartsBloc, CartsState>(
        builder: (context, state) {
          if (state is CartsInitial) {
            return const SizedBox.shrink();
          }
          if (state is CartsLoadingState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is CartsLoadedState) {
            return CartLoaddedBuilder(
              model: state.carts,
            );
          } else {
            return const Center(child: Text('Your cart is empty'));
          }
        },
      ),
      bottomSheet: const BottomCheckoutButton(),
    );
  }
}
