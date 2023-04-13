import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app_assignment/constants/constant_color.dart';
import 'package:weather_app_assignment/constants/constant_text.dart';
import 'package:weather_app_assignment/providers/loading_indicator_provider.dart';
import 'package:weather_app_assignment/providers/region_provider.dart';
import 'package:weather_app_assignment/services/cache_service.dart';
import 'package:weather_app_assignment/services/network_service.dart';
import 'package:weather_app_assignment/view/onboarding_screen.dart';
import 'package:weather_app_assignment/view/sign_in_screen.dart';
import 'package:weather_app_assignment/view/sign_up_screen.dart';
import 'package:weather_app_assignment/view/weather_detail.dart';
import 'package:weather_app_assignment/view/weather_screen.dart';

import 'constants/locale_constant.dart';
import 'localization/locale_keys.g.dart';
import 'models/region_model.dart';

part './launch_configuration.dart';

final regionProvider =
    StateNotifierProvider<RegionProvider, List<RegionModel>>((ref) {
  return RegionProvider();
});

final indicatorProvider =
    StateNotifierProvider<LoadingIndicatorProvider, bool>((ref) {
  return LoadingIndicatorProvider();
});

final completedIndProvider = Provider<bool>((ref) {
  final asd = ref.watch(indicatorProvider);

  return asd;
});
void main() => _LaunchConfiguration.configure();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
