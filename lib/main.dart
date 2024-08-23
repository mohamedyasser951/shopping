import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Config/Theme/theme.dart';
import 'package:shopping/features/Auth/features/login/data/datasources/login_data_source.dart';
import 'package:shopping/features/Auth/features/login/data/repositories/login_repository_implem.dart';
import 'package:shopping/features/Auth/features/login/presentation/bloc/login_bloc.dart';
import 'package:shopping/features/Home/PresentationLayer/bloc/home_bloc_bloc.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_cubit.dart';
import 'package:shopping/bloc_observer.dart';
import 'package:shopping/features/Layout/PresentationLayer/Pages/app_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          create: (context) => LoginBloc(
              LoginRepositoryImplement(loginDataSource: LoginDataSource())),
        ),
        BlocProvider(
          create: (context) => HomeBloc()..add(GetAllProducts()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopify',
        theme: AppTheme.lightTheme,
        home: BlocProvider(
          create: (context) => LayoutCubit(),
          child: const LayoutPage(),
        ),
      ),
    );
  }
}
