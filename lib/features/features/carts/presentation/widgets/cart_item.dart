import 'package:flutter/material.dart';
import 'package:shopping/Config/widgets/cashe_network_image.dart';
import 'package:shopping/features/features/carts/data/models/cart_model/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  const CartItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: ListTile(
          title: Text(
            product.title!,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
          subtitle: Text("${product.price!}\$"),
          leading: CashedNetworkImage(
              width: 50, height: 50, imgUrl: product.thumbnail!),
        ));
  }
}
