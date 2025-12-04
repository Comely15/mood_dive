import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primaryPurple,
    onPrimary: AppColors.white,
    secondary: AppColors.darkPurple,
    onSecondary: AppColors.white,
    surface: AppColors.lightGrey,
    onSurface: AppColors.black,
    error: AppColors.error,
    onError: AppColors.white,
  ),
  scaffoldBackgroundColor: AppColors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.black,
    elevation: 0,
    titleTextStyle: GoogleFonts.cinzel(
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.light().textTheme,
  ).apply(bodyColor: AppColors.black, displayColor: AppColors.black),
);
