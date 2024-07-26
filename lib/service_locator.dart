import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/data_sources/theme_storage.dart';
import 'domain/repositories/theme_repository.dart';
import 'domain/controllers/theme_controller.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  
  getIt.registerLazySingleton(() => ThemeStorage(prefs: sharedPreferences));
  getIt.registerLazySingleton(() => ThemeRepository(themeStorage: getIt<ThemeStorage>()));
  getIt.registerLazySingleton(() => ThemeController(themeRepository: getIt<ThemeRepository>()));
}
