import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/features/features.dart';
import 'package:surf_flutter_summer_school_24/postogram_app.dart';
import 'package:surf_flutter_summer_school_24/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(
    themeStorage: themeStorage,
  );
  final themeController = ThemeController(themeRepository: themeRepository);

  runApp(PostogramApp(themeController: themeController));
}
