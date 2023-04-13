import 'package:flutter/material.dart';
import 'package:weather_app_assignment/components/auth_button.dart';
import 'package:weather_app_assignment/extensions/padding_extension.dart';

import '../components/decorated_text_field.dart';
import '../view_model/sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends SignUpViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: context.paddingLarge,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedTextField(
                    validator: (_) => emailValidator(emailController.text),
                    hintField: "E-mail",
                    isObsecured: false,
                    textFieldController: emailController,
                  ),
                  DecoratedTextField(
                      validator: (_) =>
                          validatePassword(passwordController.text),
                      hintField: "Password",
                      isObsecured: true,
                      textFieldController: passwordController),
                  DecoratedTextField(
                      validator: (_) =>
                          matchPassword(passRepeatController.text),
                      hintField: "Password-Repeat",
                      isObsecured: true,
                      textFieldController: passRepeatController),
                  const SizedBox(height: 100),
                  AuthButton(
                    function: () => signUp(context),
                    text: 'SIGN UP',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
