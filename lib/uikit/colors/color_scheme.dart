import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/uikit/colors/color_palette.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primary;
  final Color background;
  final Color textField;
  final Color textFieldHelper;

  const AppColorScheme._(
      {required this.primary,
      required this.background,
      required this.textField,
      required this.textFieldHelper});

  AppColorScheme.light()
      : primary = LightColorPalette.black,
        background = LightColorPalette.white,
        textField = LightColorPalette.black,
        textFieldHelper = LightColorPalette.textGrey;

  AppColorScheme.dark()
      : primary = DarkColorPalette.white,
        background = DarkColorPalette.lightDark,
        textField = DarkColorPalette.white,
        textFieldHelper = DarkColorPalette.textGrey;

  @override
  ThemeExtension<AppColorScheme> copyWith(
      {Color? primary,
      Color? background,
      Color? textField,
      Color? textFieldHelper}) {
    return AppColorScheme._(
        primary: primary ?? this.primary,
        background: background ?? this.background,
        textField: textField ?? this.textField,
        textFieldHelper: textFieldHelper ?? this.textFieldHelper);
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
        primary: Color.lerp(primary, other.primary, t)!,
        background: Color.lerp(background, other.background, t)!,
        textField: Color.lerp(textField, other.textField, t)!,
        textFieldHelper:
            Color.lerp(textFieldHelper, other.textFieldHelper, t)!);
  }

  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
