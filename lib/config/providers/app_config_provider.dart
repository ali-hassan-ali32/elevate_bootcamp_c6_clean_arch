import 'package:elevate_bootcamp_c6_clean_arch/core/theme/app_colors.dart';
import 'package:elevate_bootcamp_c6_clean_arch/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppConfigProvider extends ChangeNotifier {
  final SharedPreferences _sharedPreferences;

  AppColors _appColors = CustomerThemeColors();
  late AppTheme _appTheme = AppTheme(_appColors);
  ThemeData get theme => _appTheme.themeData;

  AppConfigProvider(this._sharedPreferences);

  Future<void> changeThemeMode(ThemeOption themeOption) async {
    await _sharedPreferences.setString('theme', themeOption.name);

    _appColors = switch (themeOption) {
      ThemeOption.customer => CustomerThemeColors(),
      ThemeOption.handyman => HandymanThemeColors(),
    };

    _appTheme = AppTheme(_appColors);

    // if(getIt.isRegistered<AppColors>()) {
    //   await getIt.unregister<AppColors>();
    // }
    //
    // if(getIt.isRegistered<AppTheme>()) {
    //   await getIt.unregister<AppTheme>();
    // }
    //
    // if(getIt.isRegistered<ThemeOption>()) {
    //   await getIt.unregister<ThemeOption>();
    // }
    //
    // getIt.registerSingleton<AppColors>(appColors);
    // getIt.registerSingleton<AppTheme>(AppTheme(getIt<AppColors>()));
    // getIt.registerSingleton<ThemeOption>(themeOption);

    notifyListeners();
  }

  Future<void> setThemeMode() async {
    ThemeOption currentTheme = ThemeOption.fromString(
      _sharedPreferences.getString('theme') ?? '',
    );
    debugPrint('❌❌❌: The Default Theme Mode: ${currentTheme.name} : ❌❌❌');
    await changeThemeMode(currentTheme);
  }

  ThemeOption getCurrentTheme() {
    ThemeOption currentTheme = ThemeOption.fromString(
      _sharedPreferences.getString('theme') ?? '',
    );
    return currentTheme;
  }
}

enum ThemeOption {
  customer,
  handyman;

  static ThemeOption fromString(String themeStr) {
    switch (themeStr) {
      case 'customer':
        return ThemeOption.customer;
      case 'handyman':
        return ThemeOption.handyman;
      default:
        return ThemeOption.customer;
    }
  }
}
