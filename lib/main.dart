import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/models/custom_theme_mode.dart';
import 'service_locator.dart';
import 'domain/controllers/theme_controller.dart';
import 'presentation/pages/grid_view_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeController>(
          create: (_) => getIt<ThemeController>(),
        ),
      ],
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: _getThemeMode(themeController.themeMode),
            home: const GridViewPage(),
          );
        },
      ),
    );
  }

  ThemeMode _getThemeMode(CustomThemeMode customThemeMode) {
    switch (customThemeMode) {
      case CustomThemeMode.light:
        return ThemeMode.light;
      case CustomThemeMode.dark:
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
