import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Config/constant/app_colors.dart';
import 'package:shopping/features/Home/PresentationLayer/Pages/home_page.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_cubit.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_states.dart';
import 'package:shopping/features/features/carts/presentation/pages/cart_page.dart';
import 'package:shopping/features/features/favorites/presentation/pages/favorites_page.dart';

List<Widget> pages = [
  const HomePage(),
  const CartPage(),
  const FavoritesPage(),
  const Scaffold(
    backgroundColor: Colors.red,
  ),
];

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        LayoutCubit cubit = context.read<LayoutCubit>();

        return Scaffold(
          body: pages[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavIndex(newIndex: index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                      color: AppColors.primaryColor,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: AppColors.primaryColor,
                    ),
                    label: "cart"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite, color: AppColors.primaryColor),
                    label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      color: AppColors.primaryColor,
                    ),
                    label: "person"),
              ]),
        );
      },
    );
  }
}
