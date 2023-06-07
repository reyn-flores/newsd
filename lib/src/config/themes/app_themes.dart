import 'package:flutter/material.dart';
import 'package:newsd/src/config/colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w900,
          fontSize: 20,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        titleMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        titleSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        labelMedium: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        labelSmall: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
          fontSize: 10,
          letterSpacing: 0,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.blue,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: AppColors.blue,
    );
  }
}
