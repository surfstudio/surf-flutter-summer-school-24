import '../models/custom_theme_mode.dart';
import '../../data/data_sources/theme_storage.dart';

class ThemeRepository {
  final ThemeStorage themeStorage;

  ThemeRepository({required this.themeStorage});

  CustomThemeMode loadTheme() => themeStorage.loadTheme();

  void saveTheme(CustomThemeMode themeMode) => themeStorage.saveTheme(themeMode);
}