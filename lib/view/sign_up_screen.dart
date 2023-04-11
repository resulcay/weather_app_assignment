import 'package:flutter/material.dart';
import 'package:weather_app_assignment/extensions/padding_extension.dart';

import '../components/decorated_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passRepeatController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passRepeatController.dispose();
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
                DecoratedTextField(
                    hintField: "Password-Repeat",
                    isObsecured: true,
                    textFieldController: passRepeatController),
                const SizedBox(height: 100),
                SizedBox(
                  height: 50,
                  width: size.width,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "SIGN UP",
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
