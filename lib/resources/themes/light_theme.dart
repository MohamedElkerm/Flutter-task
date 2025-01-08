import 'package:flutter/material.dart';

import '../colors_manager.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.myWhite,
    indicatorColor: Colors.red,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: AppColors.myWhite
      )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColorCyan,
      elevation: 0.0,
    ),
  );
}
