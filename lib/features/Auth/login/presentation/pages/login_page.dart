import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping/Config/HiveManager/hive_manager.dart';
import 'package:shopping/Config/constant/app_colors.dart';
import 'package:shopping/Config/constant/app_strings.dart';
import 'package:shopping/Config/widgets/custom_button.dart';
import 'package:shopping/Config/widgets/custom_text_field.dart';
import 'package:shopping/features/Auth/login/presentation/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("LOGIN SUCCESS")));
                HiveManager.put(AppStrings.loginSuccessKey,
                    {AppStrings.loginSuccessKey: "true"}).then((val) {
                  context.go(AppStrings.layoutPagePath);
                });
              }
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("LOGIN Failure")));
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Welcome Back to the app",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "Email Address",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  CustomeTextField(
                      textEditingController: userNameController,
                      hintText: "hello@example.com"),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Password",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget Password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: const Color(0xff121D43)),
                        ),
                      )
                    ],
                  ),
                  CustomeTextField(
                      isPassword: true,
                      suffixIcon: Icons.visibility,
                      textEditingController: passwordController,
                      hintText: "*********"),
                  const SizedBox(
                    height: 20.0,
                  ),
                  state is LoginLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          color: AppColors.primaryColor,
                          width: double.infinity,
                          onPressed: () {
                            context.read<LoginBloc>().add(UserLoginEvent(
                                userName: userNameController.text,
                                password: passwordController.text));
                          },
                          widget: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Create An account",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
