import 'package:flutter/material.dart';

import '../colors_manager.dart';

ThemeData lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.myWhite,
    indicatorColor: Colors.red,
    useMaterial3: false,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColorCyan,
      elevation: 0.0,
    ),
  );
}
