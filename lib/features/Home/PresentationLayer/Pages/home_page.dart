import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Config/constant/app_colors.dart';
import 'package:shopping/features/Home/PresentationLayer/Pages/prodcut_details_page.dart';
import 'package:shopping/features/Home/PresentationLayer/Widgets/product_item.dart';
import 'package:shopping/features/Home/PresentationLayer/bloc/home_bloc_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  void _onScroll() {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.offset;
    if (currentScroll >= maxScroll * 0.9) {
      context.read<HomeBloc>().add(GetAllProducts());
    }
  }

  @override
  void initState() {
    scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: AppColors.grayColor,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: AppColors.grayColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeStates>(
        builder: (context, state) {
          switch (state.status) {
            case Status.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case Status.success:
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7, crossAxisCount: 2),
                  controller: scrollController,
                  itemCount: state.hasReashedMax
                      ? state.products.length
                      : state.products.length + 1,
                  itemBuilder: (context, index) {
                    return index >= (state.products.length)
                        ? const Align(
                            alignment: Alignment.bottomCenter,
                            child: CircularProgressIndicator())
                        : InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        product: state.products[index]),
                                  ));
                            },
                            child: ProductItem(
                              products: state.products[index],
                            ),
                          );
                  });
            case Status.error:
              return Text(state.errorMessage);
          }
        },
      ),
    );
  }
}
