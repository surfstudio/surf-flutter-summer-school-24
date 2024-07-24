import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/data/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/screens/image_carousel_screen.dart';
import 'package:surf_flutter_summer_school_24/screens/main_screen.dart';
import 'package:surf_flutter_summer_school_24/storage/theme/theme_storage.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/ui/theme_builder.dart';

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
          home: ImageCarouselScreen(),
        );
      },
    );
  }
}
