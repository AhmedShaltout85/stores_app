import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:store_app/screens/signup_screen.dart';

import 'controller/login_provider.dart';
import 'controller/product_provider.dart';
import 'controller/locale_provider.dart';
import 'controller/theme_provider.dart';
import 'l10n/app_localizations.dart';
import 'network_repos/remote_repos/app_api_service_impl.dart';
import 'screens/detail_screen.dart';
import 'screens/login_screen.dart';
import 'screens/product_test_screen.dart';
import 'screens/splash_screen.dart';
import 'utils/app_routes.dart';
import 'utils/app_theme.dart';

void main() {

  AppApiServiceImpl.init();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(
            create: (_) =>
                ProductProvider()..getProductData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRouteName,
      routes: {
        AppRoutes.splashRouteName: (context) => const SplashScreen(),
        AppRoutes.productRouteName: (context) => const ProductScreen(),
        AppRoutes.detailRouteName: (context) => const DetailScreen(),
        AppRoutes.loginRouteName: (context) => const LoginScreen(),
        AppRoutes.signupRouteName: (context) => const SignupScreen(),

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: localeProvider.locale,
  
    );
  }
}

