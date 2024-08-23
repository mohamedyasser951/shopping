import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Config/Theme/theme.dart';
import 'package:shopping/features/Auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:shopping/features/Home/PresentationLayer/bloc/home_bloc_bloc.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_cubit.dart';
import 'package:shopping/bloc_observer.dart';
import 'package:shopping/features/Layout/PresentationLayer/Pages/app_layout.dart';
import 'package:shopping/on_boarding_page.dart';
import 'package:shopping/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();

  Bloc.observer = MyBlocObserver();
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopify',
        theme: AppTheme.lightTheme,
        home: const OnBoardingPage(),
      ),
    );
  }
}
