import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Config/Theme/theme.dart';
import 'package:shopping/features/Layout/PresentationLayer/LayoutCubit/layout_cubit.dart';
import 'package:shopping/features/Layout/PresentationLayer/Pages/app_layout.dart';
import 'package:shopping/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:AppTheme.lightTheme,
      home: BlocProvider(
        create: (context) => LayoutCubit(),
        child: const LayoutPage(),
      ),
    );
  }
}
