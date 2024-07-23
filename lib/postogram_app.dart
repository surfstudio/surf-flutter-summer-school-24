import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_summer_school_24/features/features.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';
import 'package:surf_flutter_summer_school_24/uikit/uikit.dart';

class PostogramApp extends StatefulWidget {
  const PostogramApp({required this.themeController, super.key});

  final ThemeController themeController;

  @override
  State<PostogramApp> createState() => _PostogramAppState();
}

class _PostogramAppState extends State<PostogramApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      themeController: widget.themeController,
      child: ThemeBuilder(
        builder: (_, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.lightThem,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeMode,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
