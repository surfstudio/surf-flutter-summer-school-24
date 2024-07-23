import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/features.dart';
import 'package:surf_flutter_summer_school_24/features/theme/data/data.dart';

class ThemeController {
  final ThemeRepository _themeRepository;

  ThemeController({
    required ThemeRepository themeRepository,
  }) : _themeRepository = themeRepository;

  late final ValueNotifier<ThemeMode> _themeMode = ValueNotifier<ThemeMode>(
    _themeRepository.getThemeMode() ?? ThemeMode.system,
  );

  ValueListenable<ThemeMode> get themeMode => _themeMode;

  Future<void> setThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode.value) return;
    await _themeRepository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
  }

  Future<void> switchThemeMode() async {
    final newThemeMode =
        _themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _themeRepository.setThemeMode(newThemeMode);
    _themeMode.value = newThemeMode;
    log(themeMode.value.name);
  }
}
