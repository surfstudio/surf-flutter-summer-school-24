import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/di/dependency_injector.dart';
import 'package:surf_flutter_summer_school_24/domain/models/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/ui/screens/main_screen.dart';
import 'package:surf_flutter_summer_school_24/ui/widgets/theme_builder.dart';
import 'package:surf_flutter_summer_school_24/di/theme_inherited.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Инициализация зависимостей
  await DependencyInjector().initialize();

  final themeController = DependencyInjector().themeController;

  runApp(
    ThemeInherited(
      themeController: themeController,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const MainScreen(),
        );
      },
    );
  }
}
