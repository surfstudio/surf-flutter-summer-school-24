import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/app/feature/theme/data/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/app/feature/theme/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/app/my_app.dart';
import 'package:surf_flutter_summer_school_24/app/storage/theme/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(themStorage: themStorage);
  final themeController = ThemeController(themeRepository: themeRepository);
  runApp(MainApp(themeController: themeController));
}

