import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/features/Home/PresentationLayer/Pages/home_page.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_cubit.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_states.dart';

List<Widget> pages = [
  const HomePage(),
  const HomePage(),
  const Scaffold(
    backgroundColor: Colors.amber,
  ),
];

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    LayoutCubit cubit = context.read<LayoutCubit>();
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        return Scaffold(
          body: pages[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavIndex(newIndex: index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag_outlined), label: "cart"),
              ]),
        );
      },
    );
  }
}
