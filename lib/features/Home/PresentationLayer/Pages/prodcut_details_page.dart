import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Config/constant/app_colors.dart';
import 'package:shopping/Config/widgets/cashe_network_image.dart';
import 'package:shopping/features/Home/DataLayer/product_model/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Products product;
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Card(
                    child: CarouselSlider.builder(
                      itemCount: product.images!.length,
                      
                      options: CarouselOptions(
                        autoPlay: true,
                        height: 200,
                        viewportFraction: 1,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        
                        return CashedNetworkImage(
                            width: double.infinity,
                            height: 200,
                            imgUrl: product.images![index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              size: 12,
                              color: Colors.white,
                            ))),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    const Spacer(),
                    Text(
                      "${product.price}\$",
                      style: TextStyle(color: AppColors.primaryColor),
                    )
                  ],
                ),
              ),
              Text(
                product.title!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "description",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
              Text(
                product.description!,
                maxLines: 10,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheetButtons(product: product),
    );
  }
}

class BottomSheetButtons extends StatelessWidget {
  final Products product;

  const BottomSheetButtons({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("${product.price}\$"),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: AppColors.primaryColor),
              child: const Text(
                "add to cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
