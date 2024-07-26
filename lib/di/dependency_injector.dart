import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/domain/models/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/data/storage/theme_storage.dart';

import '../domain/interactors/advanced_image_interactor.dart';

class DependencyInjector {
  static final DependencyInjector _instance = DependencyInjector._internal();

  factory DependencyInjector() {
    return _instance;
  }

  DependencyInjector._internal();

  Future<void> initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final themeStorage = ThemeStorage(prefs: prefs);
    final themeRepository = ThemeRepository(themeStorage: themeStorage);
    _themeController = ThemeController(themeRepository: themeRepository);
    _advancedImageInteractor =
        AdvancedImageInteractor();
  }

  late final ThemeController _themeController;
  late final AdvancedImageInteractor _advancedImageInteractor;

  ThemeController get themeController => _themeController;

  AdvancedImageInteractor get advancedImageInteractor =>
      _advancedImageInteractor;
}
