import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/uikit/colors/color_scheme.dart';
import 'package:surf_flutter_summer_school_24/src/uikit/typography/typography.dart';

abstract class AppThemeData {
  static final lightTheme = ThemeData(
    extensions: [_lightColorScheme],
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: headline1,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.danger,
      onError: _lightColorScheme.onDanger,
      background: _lightColorScheme.background,
      onBackground: _lightColorScheme.onBackground,
      surface: _lightColorScheme.surface,
      onSurface: _lightColorScheme.onSurface,
      errorContainer: _lightColorScheme.shimmer,
      onErrorContainer: _lightColorScheme.onSecondary
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.background,
      iconTheme: IconThemeData(
        color: _lightColorScheme.primary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorScheme.background,
      selectedItemColor: _lightColorScheme.primary,
      unselectedItemColor: _lightColorScheme.onBackground,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _lightColorScheme.onPrimary,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    extensions: [_darkColorScheme],
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      titleLarge: headline1,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.danger,
      onError: _darkColorScheme.onDanger,
      background: _darkColorScheme.background,
      onBackground: _darkColorScheme.onBackground,
      surface: _darkColorScheme.surface,
      onSurface: _darkColorScheme.onSurface,
      errorContainer: _darkColorScheme.shimmer,
      onErrorContainer: _darkColorScheme.secondary
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _darkColorScheme.background,
      iconTheme: IconThemeData(
        color: _darkColorScheme.primary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkColorScheme.background,
      selectedItemColor: _darkColorScheme.primary,
      unselectedItemColor: _darkColorScheme.onBackground,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _darkColorScheme.onPrimary,
      ),
    ),
  );

  static final _lightColorScheme = AppColorScheme.light();
  static final _darkColorScheme = AppColorScheme.dark();


}