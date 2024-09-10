import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping/Config/HiveManager/hive_manager.dart';
import 'package:shopping/Config/Theme/theme.dart';
import 'package:shopping/Config/constant/app_router.dart';
import 'package:shopping/Config/constant/app_strings.dart';
import 'package:shopping/features/features/login/presentation/bloc/login_bloc.dart';
import 'package:shopping/features/Home/PresentationLayer/bloc/home_bloc_bloc.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_cubit.dart';
import 'package:shopping/bloc_observer.dart';
import 'package:shopping/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await Hive.initFlutter();
  await HiveManager.init();
  AppRouter.init();
  Bloc.observer = MyBlocObserver();
  print(await HiveManager.get(AppStrings.onBoardingKey));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<HomeBloc>()..add(GetAllProducts()),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.goRouter,
        debugShowCheckedModeBanner: false,
        title: 'Shopify',
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
