import 'package:shopping/Config/constant/app_colors.dart';
import 'package:flutter/material.dart';

class BottomCheckoutButton extends StatelessWidget {
  const BottomCheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 220,
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor),
                onPressed: () {},
                child: const Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                )),
          ),
        )
      ],
    );
  }
}
