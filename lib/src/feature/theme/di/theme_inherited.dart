import 'package:flutter/material.dart';
import '../domain/theme_controller.dart';

class ThemeInherited extends InheritedWidget {
  const ThemeInherited({
    super.key,
    required this.themeController,
    required super.child,
  });

  final ThemeController themeController;

  static ThemeController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeInherited>()
        ?.themeController;
  }

  static ThemeController of(BuildContext context) {
    final ThemeController? result = maybeOf(context);
    assert(result != null, 'No MyThemeInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeInherited oldWidget) => false;
}