// ! все что ниже - ctrl+v

import 'package:surf_flutter_summer_school_24/feature/theme/domain/theme_controller.dart';
import 'package:flutter/material.dart';

class ThemeInherited extends InheritedWidget {

  
  final ThemeController themeController;

  const ThemeInherited({
    super.key,
    required this.themeController,
    required super.child,
  });


  static ThemeController? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ThemeInherited>()
        ?.themeController;
  }

  static ThemeController of(BuildContext context) {
    final ThemeController? result = maybeOf(context);
    assert(result != null, 'No MyThemeInherited found in context'); // ? Почему !=    (assert-проверка условий)
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeInherited oldWidget) => false;  // ? зависимые виджеты не уведомляются об изменениях
}
