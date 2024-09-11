import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/Config/constant/app_strings.dart';
import 'package:shopping/features/Auth/login/presentation/pages/login_page.dart';
import 'package:shopping/features/Layout/PresentationLayer/Pages/app_layout.dart';
import 'package:shopping/on_boarding_page.dart';

class AppRouter {
  static Widget startpage = const LayoutPage();
  bool onBoardingFinish = false;
  bool loginSuccess = false;
  init() async {
    // onBoardingFinish = await HiveManager.get(AppStrings.onBoardingPath)??false;
    // loginSuccess = await HiveManager.get(AppStrings.loginSuccessKey)??false;
  }

  AppRouter.init() {
    // init();
    // log(onBoardingFinish.toString());
    // if (onBoardingFinish) {
    //   startpage = LoginPage();
    // } else if (loginSuccess) {
    //   startpage = const LayoutPage();
    // } else {
    //   startpage = const OnBoardingPage();
    // }
  }

  static GoRouter goRouter = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => startpage,
    ),
    GoRoute(
      path: AppStrings.onBoardingPath,
      builder: (context, state) => const OnBoardingPage(),
    ),
    GoRoute(
      path: AppStrings.loginPagePath,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: AppStrings.layoutPagePath,
      builder: (context, state) => const LayoutPage(),
    ),
  ]);
}
