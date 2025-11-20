import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'controller/product_provider.dart';
import 'controller/locale_provider.dart';
import 'controller/theme_provider.dart';
import 'l10n/app_localizations.dart';
import 'screens/product_test_screen.dart';
import 'screens/splash_screen.dart';
import 'utils/app_routes.dart';
import 'utils/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
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
      initialRoute: AppRoutes.productRouteName,
      routes: {
        AppRoutes.splashRouteName: (context) => const SplashScreen(),
        AppRoutes.productRouteName: (context) => const ProductScreen(),

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      locale: localeProvider.locale,
      // locale: Locale('en'),
      // themeMode: ThemeMode.dark,
    );
  }
}

/// utils :
/// 1- colors
/// 2- routeNames
/// 3- assets => images
/// 4- theme => light , dark mode