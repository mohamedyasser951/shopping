import 'package:flutter/material.dart';
import 'package:shopping/Config/constant/app_colors.dart';

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
      elevation: 0.8,
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 1.1,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: AppColors.primaryColor,
                        size: 20,
                      )),
                  Image(
                      fit: BoxFit.contain,
                      image: NetworkImage(products.thumbnail!)),
                ],
              ),
            ),
            Text(
              products.title!,
              maxLines: 1,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              products.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${products.price}\$"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
