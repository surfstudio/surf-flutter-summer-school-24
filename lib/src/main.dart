import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/src/feature/theme/data/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/src/feature/theme/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/src/feature/theme/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/src/feature/theme/ui/theme_builder.dart';
import 'package:surf_flutter_summer_school_24/src/pages/gallery.dart';
import 'package:surf_flutter_summer_school_24/src/storage/theme/theme_storage.dart';
import 'package:surf_flutter_summer_school_24/src/uikit/theme/theme_data.dart';

void main() async {
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
  runApp(MainApp(
    themeController: themeController,
  ));
}

class MainApp extends StatelessWidget {
  final ThemeController themeController;

  const MainApp({super.key, required this.themeController,});

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
        themeController: themeController,
        child: ThemeBuilder(
          builder: (_, themeMode) {
            return MaterialApp(
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: themeMode,
              home:  Gallery()
            );
          },
        )
    );
  }
}

