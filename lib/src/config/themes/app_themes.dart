import 'package:flutter/material.dart';
import 'package:newsd/src/config/colors.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: AppColors.blue,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.blue,
    );
  }
}
