import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/cache_service.dart';
import '../view/sign_in_screen.dart';

abstract class SignInViewModel extends State<SignInScreen> {
  late final CacheManager cacheInstance;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    cacheInstance = CacheManager.instance;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  signIn() {
    String secretWord = cacheInstance.getStringValue(PreferencesKeys.TOKEN);
  }

  navigateToSignUp() => context.go('/sign-up');
}
