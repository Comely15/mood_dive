import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.primaryPurple,
    onPrimary: AppColors.white,
    secondary: AppColors.lightPurple,
    onSecondary: AppColors.black,
    surface: AppColors.darkGrey,
    onSurface: AppColors.white,
    error: AppColors.error,
    onError: AppColors.black,
  ),
  scaffoldBackgroundColor: AppColors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.black,
    foregroundColor: AppColors.white,
    elevation: 0,
    titleTextStyle: GoogleFonts.cinzel(
      color: AppColors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.dark().textTheme,
  ).apply(bodyColor: AppColors.white, displayColor: AppColors.white),
);
