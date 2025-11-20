import 'package:flutter/material.dart';
import 'package:store_app/utils/app_colors.dart';
import 'package:store_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
    ),
    textTheme: TextTheme(headlineLarge: AppStyles.medium20Black),
    drawerTheme: const DrawerThemeData(
      backgroundColor: AppColors.blackColor,
    ),
    listTileTheme: const ListTileThemeData(
        textColor: AppColors.whiteColor, iconColor: AppColors.whiteColor),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
    ),
    textTheme: TextTheme(headlineLarge: AppStyles.medium20White),
  );
}
