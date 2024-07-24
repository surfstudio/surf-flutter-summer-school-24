import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/storage/theme_storage/theme_storage.dart';
import 'package:surf_flutter_summer_school_24/theme%20/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/theme%20/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/theme%20/repository/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/theme%20/theme_data.dart';
import 'package:surf_flutter_summer_school_24/theme%20/ui/theme_builder.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/grid_page/grid_page_widget.dart';

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

  const MainApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      themeController: themeController,
      child: ThemeBuilder(
        builder: (_, themeMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeMode,
            home: const GridPageScreen(),
          );
        },
      ),
    );
  }
}
