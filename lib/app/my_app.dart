import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/ui/theme_builder.dart';
import 'package:surf_flutter_summer_school_24/feature/screens/start_page/start_page_widget.dart';
import 'package:surf_flutter_summer_school_24/uikit/theme/theme_data.dart';

class MainApp extends StatelessWidget {
    final ThemeController themeController;
  const MainApp({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
        themeController: themeController,
        child: ThemeBuilder(builder: (_, themeMode) {
          return MaterialApp(
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeMode,

            home: const StartPageWidget()

            // home: StartPageModelProvider(
            //   model: StartPageModel(),
            //   child: const StartPageWidget()
            //   ),

            // initialRoute: '/start_page',
            // routes: {
            //   '/start_page': (context) => const StartPage(),
            //   '/opened_image': (context) => PhotoPage(index: ),
            // },
          );
        }));
  }
}

