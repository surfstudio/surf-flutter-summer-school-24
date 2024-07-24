import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/domain/models/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/ui/screens/main_screen.dart';
import 'package:surf_flutter_summer_school_24/ui/widgets/theme_builder.dart';
import 'package:surf_flutter_summer_school_24/data/storage/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(themeStorage: themeStorage);
  final themeController = ThemeController(themeRepository: themeRepository);

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
