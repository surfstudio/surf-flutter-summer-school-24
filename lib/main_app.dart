import 'package:flutter/material.dart';
import 'feature/theme/di/theme_inherited.dart';
import 'feature/theme/domain/theme_controller.dart';
import 'feature/theme/ui/theme_builder.dart';
import 'screens/photo_grid_screen.dart';
import 'data/image_data.dart';
import 'uikit/theme/theme_data.dart';

class MainApp extends StatelessWidget {
  final ThemeController themeController;
  
  const MainApp({required this.themeController, super.key});

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
            home: PhotoGridScreen(imageList: imageList),
          );
        },
      ),
    );
  }
}
