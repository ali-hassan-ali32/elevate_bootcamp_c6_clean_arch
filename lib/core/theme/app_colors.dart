import 'package:flutter/material.dart';

sealed class AppColors {
  MaterialColor get primaryColor;
  MaterialColor get neutralColor;

  Color get primary;
  Color get white;
  Color get black;
  Color get darkGray;
  Color get errorsColor;

  Color get success;
  Color get lightGray;
  Color get lightGreen;
  Color get lightPink;
  Color get gray;
}

class CustomerThemeColors implements AppColors {
  @override
  MaterialColor get primaryColor =>
      const MaterialColor(0xFFFF6B35, <int, Color>{
        10: Color(0xFFFFF0EB),
        20: Color(0xFFFFD6C7),
        30: Color(0xFFFFB99D),
        40: Color(0xFFFF9C73),
        50: Color(0xFFFF7F49),
        60: Color(0xFFFF6B35),
        70: Color(0xFFE65520),
        80: Color(0xFFB4431A),
        90: Color(0xFF833212),
        100: Color(0xFF4F1F09),
      });

  @override
  MaterialColor get neutralColor =>
      const MaterialColor(0xFF9E9E9E, <int, Color>{
        10: Color(0xFFF5F5F5),
        20: Color(0xFFEEEEEE),
        30: Color(0xFFE0E0E0),
        40: Color(0xFFBDBDBD),
        50: Color(0xFF9E9E9E),
        60: Color(0xFF757575),
        70: Color(0xFF616161),
        80: Color(0xFF424242),
        90: Color(0xFF303030),
        100: Color(0xFF212121),
      });

  @override
  Color get primary => const Color(0xFFFF6B35);

  @override
  Color get white => const Color(0xFFFFFFFF); // bgSecondary

  @override
  Color get black => const Color(0xFF2C3E50); // textPrimary

  @override
  Color get darkGray => const Color(0xFF7F8C8D); // textSecondary

  @override
  Color get errorsColor => const Color(0xFF721C24); // cancelledText

  @override
  Color get success => const Color(0xFF155724); // activeText

  @override
  Color get lightGray => const Color(0xFFF5F7FA); // bgPrimary

  @override
  Color get lightGreen => const Color(0xFFD4EDDA); // activeBg

  @override
  Color get lightPink => const Color(0xFFF8D7DA); // cancelledBg

  @override
  Color get gray => const Color(0xFF9E9E9E); // neutral[50]
}

class HandymanThemeColors implements AppColors {
  @override
  MaterialColor get primaryColor =>
      const MaterialColor(0xFF4ECDC4, <int, Color>{
        10: Color(0xFFE6F7F6),
        20: Color(0xFFBFEAE8),
        30: Color(0xFF99DDD9),
        40: Color(0xFF73D0CB),
        50: Color(0xFF4EC3BC),
        60: Color(0xFF4ECDC4),
        70: Color(0xFF44A3A0),
        80: Color(0xFF357C7C),
        90: Color(0xFF285656),
        100: Color(0xFF1B3031),
      });

  @override
  MaterialColor get neutralColor =>
      const MaterialColor(0xFF9E9E9E, <int, Color>{
        10: Color(0xFFF5F5F5),
        20: Color(0xFFEEEEEE),
        30: Color(0xFFE0E0E0),
        40: Color(0xFFBDBDBD),
        50: Color(0xFF9E9E9E),
        60: Color(0xFF757575),
        70: Color(0xFF616161),
        80: Color(0xFF424242),
        90: Color(0xFF303030),
        100: Color(0xFF212121),
      });

  @override
  Color get primary => const Color(0xFF4ECDC4);

  @override
  Color get white => const Color(0xFFFFFFFF); // bgSecondary

  @override
  Color get black => const Color(0xFF2C3E50); // textPrimary

  @override
  Color get darkGray => const Color(0xFF7F8C8D); // textSecondary

  @override
  Color get errorsColor => const Color(0xFF721C24); // cancelledText

  @override
  Color get success => const Color(0xFF155724); // activeText

  @override
  Color get lightGray => const Color(0xFFF5F7FA); // bgPrimary

  @override
  Color get lightGreen => const Color(0xFFD4EDDA); // activeBg

  @override
  Color get lightPink => const Color(0xFFF8D7DA); // cancelledBg

  @override
  Color get gray => const Color(0xFF9E9E9E); // neutral[50]
}
