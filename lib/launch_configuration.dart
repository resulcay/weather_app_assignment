part of "./main.dart";

class _LaunchConfiguration {
  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const OnboardingScreen(),
          routes: [
            GoRoute(
              path: 'auth/sign-up',
              builder: (context, state) => const SignUpScreen(),
            ),
            GoRoute(
              path: 'auth/sign-in',
              builder: (context, state) => const SignInScreen(),
            ),
          ]),
    ],
  );

  static configure() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    runApp(
      EasyLocalization(
          supportedLocales: const [LocaleConstant.engLocale],
          path: LocaleConstant.TRANSLATION_PATH,
          fallbackLocale: LocaleConstant.engLocale,
          child: const MyApp()),
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
