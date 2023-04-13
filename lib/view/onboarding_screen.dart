import 'package:flutter/material.dart';
import 'package:weather_app_assignment/services/cache_service.dart';
import 'package:weather_app_assignment/view/sign_in_screen.dart';
import 'package:weather_app_assignment/view/weather_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool checkUserStatus() {
    final cacheInstance = CacheManager.instance;
    String secretWord = cacheInstance.getStringValue(PreferencesKeys.TOKEN);
    secretWord = secretWord.trim();

    if (secretWord.isEmpty) return true;

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return checkUserStatus() ? const WeatherScreen() : const SignInScreen();
  }
}
