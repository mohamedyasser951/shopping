import 'package:flutter/material.dart';
import 'package:shopping/Config/widgets/custom_button.dart';
import 'package:shopping/Config/widgets/custom_text_field.dart';
import 'package:shopping/features/Auth/features/login/data/datasources/login_data_source.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90,
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Welcome Back to the app",
                style: Theme.of(context).textTheme.bodyLarge,
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: const Color(0xff121D43)),
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
              CustomButton(
                color: const Color(0xff121D43),
                width: double.infinity,
                onPressed: () {
                  LoginDataSource().userLogin(name: "", password: "");
                },
                widget: Text(
                  "Login",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
              const Divider(
                height: 48,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Create An account",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: const Color(0xff121D43)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
