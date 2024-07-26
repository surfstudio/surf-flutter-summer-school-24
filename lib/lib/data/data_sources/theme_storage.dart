import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/custom_theme_mode.dart';

class ThemeStorage {
  final SharedPreferences prefs;

  ThemeStorage({required this.prefs});

  CustomThemeMode loadTheme() {
    var themeIndex = prefs.getInt('themeMode') ?? 0;
    return CustomThemeModeExtension.fromIndex(themeIndex);
  }

  void saveTheme(CustomThemeMode themeMode) {
    prefs.setInt('themeMode', themeMode.index);
  }
}