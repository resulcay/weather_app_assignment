import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_assignment/constants/constant_color.dart';
import 'package:weather_app_assignment/constants/constant_text.dart';
import 'package:weather_app_assignment/view/onboarding_screen.dart';
import 'package:weather_app_assignment/view/sign_in_screen.dart';
import 'package:weather_app_assignment/view/sign_up_screen.dart';

import 'constants/locale_constant.dart';
import 'localization/locale_keys.g.dart';

part './launch_configuration.dart';

void main() => _LaunchConfiguration.configure();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateTitle: (context) => LocaleKeys.appTitle.tr(),
      theme: _LaunchConfiguration.themeData(),
      routerConfig: _LaunchConfiguration.router,
    );
  }
}
