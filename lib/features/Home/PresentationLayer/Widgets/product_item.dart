import 'package:flutter/material.dart';

import 'package:shopping/features/Home/DataLayer/product_model/product_model.dart';

class ProductItem extends StatelessWidget {
  final Products products;
  const ProductItem({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.9,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Image(
                fit: BoxFit.contain, image: NetworkImage(products.thumbnail!)),
          ),
          Text(
            products.title!,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            products.description!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(products.price.toString()),
              const CircleAvatar(child: Icon(Icons.favorite))
            ],
          ),
        ],
      ),
    );
  }
}
