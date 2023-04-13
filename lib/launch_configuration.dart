part of "./main.dart";

class _LaunchConfiguration {
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const OnboardingScreen(),
          routes: [
            GoRoute(
              path: 'sign-in',
              builder: (context, state) => const SignInScreen(),
            ),
            GoRoute(
              path: 'sign-up',
              builder: (context, state) => const SignUpScreen(),
            ),
          ]),
      GoRoute(
          path: '/weather',
          builder: (context, state) => const WeatherScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              builder: (context, state) => const WeatherDetailScreen(),
            ),
          ])
    ],
  );

  static configure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
    CacheManager.prefrencesInit();
    runApp(
      EasyLocalization(
        supportedLocales: const [LocaleConstant.engLocale],
        path: LocaleConstant.TRANSLATION_PATH,
        fallbackLocale: LocaleConstant.engLocale,
        child: const ProviderScope(
          child: MyApp(),
        ),
      ),
    );
  }

  static themeData() {
    return ThemeData(
      colorSchemeSeed: ConstantColor.primaryColor,
      useMaterial3: true,
      fontFamily: ConstantText.fontName,
    );
  }
}
