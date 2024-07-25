// ! все что ниже - ctrl+v

import 'package:surf_flutter_summer_school_24/feature/theme/di/theme_inherited.dart';
import 'package:flutter/material.dart';

typedef ThemeWidgetBuilder = Widget Function(
  BuildContext context,
  ThemeMode themeMode,
);

class ThemeBuilder extends StatefulWidget {

  final ThemeWidgetBuilder builder;

  const ThemeBuilder({
    required this.builder,
    super.key,
  });


  @override
  State<ThemeBuilder> createState() => _ThemeBuilderState();
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(  // ? че такое ValueListenableBuilder и откуда  тот, кто слушает valuenotifier
      valueListenable: ThemeInherited.of(context).themeMode, // ? вопрос про ThemeMode в theme_storage
      builder: (
        builderContext,
        themeMode,
        _,
      ) =>
          widget.builder(  // ? Что такое widget здесь и откуда у него метод builder
        builderContext,
        themeMode,
      ),
    );
  }
}
