import 'package:elevate_bootcamp_c6_clean_arch/core/theme/app_colors.dart';
import 'package:flutter/material.dart';


class AppTheme {
  final AppColors _appColors;

  AppTheme(this._appColors);

  late final ThemeData themeData = ThemeData(
    useMaterial3: true,

    colorScheme: ColorScheme(
      brightness: Brightness.light,

      // Primary
      primary: _appColors.primary,
      onPrimary: _appColors.white,

      // Secondary (same palette since AppColors doesn't expose secondary yet)
      secondary: _appColors.primary,
      onSecondary: _appColors.white,

      // Error
      error: _appColors.errorsColor,
      onError: _appColors.white,

      // Surface
      surface: _appColors.white,
      onSurface: _appColors.black,
    ),

    scaffoldBackgroundColor: _appColors.lightGray,

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: _appColors.primary,
      foregroundColor: _appColors.white,
    ),

    cardTheme: CardThemeData(
      color: _appColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    dividerColor: _appColors.gray,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _appColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _appColors.gray),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: _appColors.gray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _appColors.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _appColors.errorsColor,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _appColors.errorsColor,
          width: 2,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _appColors.primary,
        foregroundColor: _appColors.white,
        disabledBackgroundColor: _appColors.gray,
        disabledForegroundColor: _appColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: _appColors.primary,
        side: BorderSide(color: _appColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: _appColors.primary,
      ),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: _appColors.black),
      bodyMedium: TextStyle(color: _appColors.black),
      bodySmall: TextStyle(color: _appColors.darkGray),
      titleLarge: TextStyle(
        color: _appColors.black,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: _appColors.black,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: _appColors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}