import 'package:final_project/core/utils/colors.dart';
import 'package:flutter/material.dart';

/// Light Mode Theme
ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.lightPrimaryColor,
  scaffoldBackgroundColor: AppColors.lightBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightPrimaryColor,
    foregroundColor: AppColors.lightTextColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightTextColor, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.lightTextColor, fontSize: 14),
    headlineLarge: TextStyle(
        color: AppColors.lightTextColor,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: AppColors.lightTextColor, fontSize: 18),
    labelSmall: TextStyle(color: AppColors.lightSecondaryColor, fontSize: 12),
  ),
  colorScheme: const ColorScheme.light(
    surface: AppColors.lightBackgroundColor,
    primary: AppColors.lightPrimaryColor,
    secondary: AppColors.lightSecondaryColor,
    error: AppColors.lightErrorColor,
    onPrimary: Colors.white,
    onSurface: AppColors.lightTextColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.lightButtonColor, // Primary button color
    disabledColor: AppColors.lightBorderColor, // Disabled button color
    textTheme: ButtonTextTheme.primary, // Text follows primary theme color
    highlightColor:
        AppColors.lightAccentColor, // Highlight color on interaction
  ),
  dividerColor: AppColors.lightBorderColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.lightButtonColor),
      foregroundColor: WidgetStateProperty.all(AppColors.lightTextColor),
      overlayColor: WidgetStateProperty.all(AppColors.lightAccentColor),
    ),
  ),
);

/// Dark Mode Theme
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.darkPrimaryColor,
  scaffoldBackgroundColor: AppColors.darkBackgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkPrimaryColor,
    foregroundColor: AppColors.darkTextColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkTextColor, fontSize: 16),
    bodyMedium: TextStyle(color: AppColors.darkTextColor, fontSize: 14),
    headlineLarge: TextStyle(
        color: AppColors.darkTextColor,
        fontSize: 24,
        fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(color: AppColors.darkTextColor, fontSize: 18),
    labelSmall: TextStyle(color: AppColors.darkSecondaryColor, fontSize: 12),
  ),
  colorScheme: const ColorScheme.dark(
    surface: AppColors.darkBackgroundColor,
    primary: AppColors.darkPrimaryColor,
    secondary: AppColors.darkSecondaryColor,
    error: AppColors.darkErrorColor,
    onPrimary: Colors.white, // Text color on primary color
    onSurface: AppColors.darkTextColor,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.darkButtonColor, // Primary button color
    disabledColor: AppColors.darkBorderColor, // Disabled button color
    textTheme: ButtonTextTheme.primary, // Text follows primary theme color
    highlightColor: AppColors.darkAccentColor, // Highlight color on interaction
  ),
  dividerColor: AppColors.darkBorderColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.darkButtonColor),
      foregroundColor: WidgetStateProperty.all(AppColors.darkTextColor),
      overlayColor: WidgetStateProperty.all(AppColors.darkAccentColor),
    ),
  ),
);
