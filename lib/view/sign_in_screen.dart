import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_assignment/extensions/padding_extension.dart';

import '../components/decorated_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: context.paddingLarge,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DecoratedTextField(
                  hintField: "E-mail",
                  isObsecured: false,
                  textFieldController: emailController,
                ),
                DecoratedTextField(
                    hintField: "Password",
                    isObsecured: true,
                    textFieldController: passwordController),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.go('/auth/sign-up');
                    },
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
