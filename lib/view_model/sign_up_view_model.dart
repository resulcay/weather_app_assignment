import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_assignment/extensions/email_extension.dart';

import '../services/cache_service.dart';
import '../view/sign_up_screen.dart';

abstract class SignUpViewModel extends State<SignUpScreen> {
  late final CacheManager cacheInstance;
  late final GlobalKey<FormState> formKey;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController passRepeatController;

  @override
  void initState() {
    cacheInstance = CacheManager.instance;
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passRepeatController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    passRepeatController.dispose();
  }

  signUp(BuildContext context) {
    if (formKey.currentState != null) {
      if (formKey.currentState!.validate()) {
        cacheInstance.setString(PreferencesKeys.TOKEN, 'magic');
        context.go('/');
      }
    }
  }

  String? emailValidator(String input) {
    return input.isValidEmail() ? null : "Invalid email format";
  }

  String? validatePassword(String value) {
    RegExp allRules =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    RegExp digit = RegExp(r'^(?=.*?[0-9])');
    RegExp upperLetter = RegExp(r'^(?=.*?[A-Z])');
    RegExp lowerLetter = RegExp(r'^(?=.*?[a-z])');
    RegExp illegalCharacter = RegExp(r'^(?=.*?[!@#\$&*~])');

    if (value.isEmpty) {
      return 'Please enter password';
    } else if (value.length < 6) {
      return 'At least 6 characters';
    } else if (!digit.hasMatch(value)) {
      return 'At least one digit';
    } else if (!upperLetter.hasMatch(value)) {
      return 'At least one upper letter';
    } else if (!lowerLetter.hasMatch(value)) {
      return 'At least one lower letter';
    } else if (!illegalCharacter.hasMatch(value)) {
      return 'At least one [!@#\$&*~]';
    } else {
      if (!allRules.hasMatch(value)) {
        return 'Invalid password';
      } else {
        return null;
      }
    }
  }

  String? matchPassword(String? repeatedPassword) {
    return repeatedPassword == passwordController.text
        ? null
        : "Password does not match";
  }
}
