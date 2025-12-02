import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:store_app/network_repos/local_repo/cache_helper.dart';
import 'package:store_app/screens/signup_screen.dart';

import 'controller/login_provider.dart';
import 'controller/product_provider.dart';
import 'controller/locale_provider.dart';
import 'controller/signup_provider.dart';
import 'controller/theme_provider.dart';
import 'l10n/app_localizations.dart';
import 'network_repos/remote_repos/app_api_service_impl.dart';
import 'screens/detail_screen.dart';
import 'screens/login_screen.dart';
import 'screens/product_test_screen.dart';
import 'screens/splash_screen.dart';
import 'utils/app_routes.dart';
import 'utils/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppApiServiceImpl.init();

  String? token = await CacheHelper.getToken();
  bool isLoggedIn = token != null && token.isNotEmpty;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
        ChangeNotifierProvider(
            create: (_) => ProductProvider()..getProductData()),
      ],
      child: MyApp(
        isLoggedIn: isLoggedIn,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          isLoggedIn ? AppRoutes.productRouteName : AppRoutes.loginRouteName,
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
