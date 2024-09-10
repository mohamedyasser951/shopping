import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/Config/HiveManager/hive_manager.dart';
import 'package:shopping/Config/constant/app_colors.dart';
import 'package:shopping/Config/constant/app_images.dart';
import 'package:shopping/Config/constant/app_strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  String imgPath;
  String title;
  String description;
  OnBoardingModel({
    required this.imgPath,
    required this.title,
    required this.description,
  });
}

List<OnBoardingModel> onBoaedingData = [
  OnBoardingModel(
      imgPath: Assets.onboarding1,
      title: "Choose Product",
      description:
          "A product is the item offered for sale. \n A product can be a service or an item.\n It can be physical or in virtual or cyber form"),
  OnBoardingModel(
      imgPath: Assets.onboarding2,
      title: "Make Payment",
      description:
          "Payment is the transfer of money \n services in exchange product or Payments typically made terms agreed "),
  OnBoardingModel(
      imgPath: Assets.onboarding2,
      title: "Get Your Order",
      description:
          "Business or commerce an order is a stated intention either spoken to engage in a commercial transaction specific products "),
];

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPagetState();
}

class _OnBoardingPagetState extends State<OnBoardingPage> {
  PageController pageController = PageController();
  bool isLast = false;

  void submitStateofOnBoarding() async {
    await HiveManager.put(AppStrings.onBoardingKey, {
      AppStrings.onBoardingKey: "true",
    }).then((val) {
      // print(val);
      context.go(AppStrings.loginPagePath);
    });
    // await Hive.box(AppStrings.settingsBox)
    //     .put("onBoarding", true)
    //     .then((value) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => LoginPage(),
    //     ));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  submitStateofOnBoarding();
                },
                child: const Text("Skip"),
              ),
            ),
            Expanded(
                child: PageView.builder(
              onPageChanged: (value) {
                if (value == onBoaedingData.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              controller: pageController,
              itemCount: onBoaedingData.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  OnBoardingItem(model: onBoaedingData[index]),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: onBoaedingData.length,
                  effect: WormEffect(
                      type: WormType.thin,
                      dotWidth: 10,
                      dotHeight: 10,
                      spacing: 4,
                      dotColor: AppColors.grayColor,
                      activeDotColor: AppColors.primaryColor),
                ),
                TextButton(
                    onPressed: () {
                      if (isLast) {
                        submitStateofOnBoarding();
                      } else {
                        pageController.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.bounceOut);
                      }
                    },
                    child: const Text("Next"))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  const OnBoardingItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: SvgPicture.asset(
          model.imgPath,
        )),
        Text(
          model.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          model.description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontSize: 16, color: AppColors.grayColor),
        ),
        const SizedBox(
          height: 80,
        )
      ],
    );
  }
}
