import 'package:flutter/material.dart';
import '../repositories/theme_repository.dart';
import '../models/custom_theme_mode.dart';

class ThemeController extends ChangeNotifier {
  final ThemeRepository themeRepository;
  late CustomThemeMode _currentThemeMode;

  ThemeController({required this.themeRepository}) {
    _currentThemeMode = themeRepository.loadTheme();
  }

  CustomThemeMode get themeMode => _currentThemeMode;

  void setThemeMode(CustomThemeMode themeMode) {
    _currentThemeMode = themeMode;
    themeRepository.saveTheme(themeMode);
    notifyListeners();
  }
}