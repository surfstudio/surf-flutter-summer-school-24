enum CustomThemeMode {
  light,
  dark,
}

extension CustomThemeModeExtension on CustomThemeMode {
  int get index {
    switch (this) {
      case CustomThemeMode.light:
        return 0;
      case CustomThemeMode.dark:
        return 1;
    }
  }

  static CustomThemeMode fromIndex(int index) {
    switch (index) {
      case 0:
        return CustomThemeMode.light;
      case 1:
        return CustomThemeMode.dark;
      default:
        return CustomThemeMode.light;
    }
  }
}
