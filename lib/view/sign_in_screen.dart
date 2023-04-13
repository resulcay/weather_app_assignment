import 'package:flutter/material.dart';
import 'package:weather_app_assignment/extensions/padding_extension.dart';
import 'package:weather_app_assignment/view_model/sign_in_view_model.dart';

import '../components/auth_button.dart';
import '../components/decorated_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends SignInViewModel {
  @override
  Widget build(BuildContext context) {
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
                  textFieldController: passwordController,
                ),
                const SizedBox(height: 40),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => navigateToSignUp(),
                    child: const Text('Register'),
                  ),
                ),
                const SizedBox(height: 40),
                AuthButton(function: () {}, text: 'SIGN IN'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
