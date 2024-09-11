
import 'package:flutter/material.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/cart_model.dart';
import 'package:shopping/features/features/carts/presentation/widgets/cart_item.dart';

class CartLoaddedBuilder extends StatelessWidget {
  final CartModel model;
  const CartLoaddedBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: model.products!.length,
          itemBuilder: (context, index) => CartItem(
            product: model.products![index],
          ),
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total : ",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  "${model.total}\$",
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
