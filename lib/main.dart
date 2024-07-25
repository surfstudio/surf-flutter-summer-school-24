import 'feature/theme/domain/theme_controller.dart';
import 'feature/theme/data/theme_repository.dart';
import 'storage/theme/theme_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(
    prefs: prefs,
  );
  final themeRepository = ThemeRepository(
    themeStorage: themeStorage,
  );
  final themeController = ThemeController(
    themeRepository: themeRepository,
  );
  runApp(MainApp(themeController: themeController));
}


// TODO: UIKit
// TODO: Оформить readme.md
// TODO: Разнести код на слои
// TODO: Декомпозиция

// TODO: Реализовать доменные модели
// TODO: Реализовать мокирование данных
// TODO: Реализовать state management не через setState
// TODO: Реализовать DI или ServiceLocator
