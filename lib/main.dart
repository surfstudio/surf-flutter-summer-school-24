import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Список изображений для карусели
final List<String> imgList = [
  'assets/images/Default_madoka_magica_art_0.jpg',
  'assets/images/Default_madoka_magica_art_1.jpg',
  'assets/images/Default_madoka_magica_art_2.jpg',
  'assets/images/Default_madoka_magica_art_3.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_0.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_1.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_2.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_3.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_0.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_1.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_2.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_3.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_in_spa_0.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_in_spa_1.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_in_spa_2.jpg',
  'assets/images/Default_madoka_magica_from_anime_Madoka_Magica_with_bow_in_spa_3.jpg',
];

// Перечисление CustomThemeMode для новых тем
enum CustomThemeMode {
  light,
  dark,
  reading,
  space,
}

extension CustomThemeModeExtension on CustomThemeMode {
  int get index {
    switch (this) {
      case CustomThemeMode.light:
        return 0;
      case CustomThemeMode.dark:
        return 1;
      case CustomThemeMode.reading:
        return 2;
      case CustomThemeMode.space:
        return 3;
    }
  }

  static CustomThemeMode fromIndex(int index) {
    switch (index) {
      case 0:
        return CustomThemeMode.light;
      case 1:
        return CustomThemeMode.dark;
      case 2:
        return CustomThemeMode.reading;
      case 3:
        return CustomThemeMode.space;
      default:
        return CustomThemeMode.light;
    }
  }
}

// Хранилище темы
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

// Репозиторий для темы
class ThemeRepository {
  final ThemeStorage themeStorage;

  ThemeRepository({required this.themeStorage});

  CustomThemeMode loadTheme() => themeStorage.loadTheme();

  void saveTheme(CustomThemeMode themeMode) => themeStorage.saveTheme(themeMode);
}

// Контроллер для управления темой
class ThemeController extends ChangeNotifier {
  final ThemeRepository themeRepository;
  late CustomThemeMode _currentThemeMode;

  ThemeController({required this.themeRepository}) {
    _currentThemeMode = themeRepository.loadTheme();
  }

  CustomThemeMode get themeMode => _currentThemeMode;

  void setThemeMode(CustomThemeMode themeMode) {
    _currentThemeMode = themeMode;
    themeRepository.saveTheme(themeMode);
    notifyListeners();
  }
}

// Страница с каруселью
class CarouselPage extends StatefulWidget {
  final int initialIndex;
  const CarouselPage({Key? key, required this.initialIndex}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  late int _currentImageIndex;

  final List<String> titleList = [
    '01.03.2023',
    '02.05.2023',
    '03.06.2023',
    '03.01.2024',
    '04.01.2024',
    '03.04.2024',
    '01.06.2024',
    '02.09.2025',
    '01.03.2025',
    '02.05.2025',
    '03.06.2025',
    '03.01.2026',
    '04.01.2026',
    '03.04.2026',
    '01.06.2026',
    '02.09.2026',
  ];

  @override
  void initState() {
    super.initState();
    _currentImageIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titleList[_currentImageIndex]),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 36.0),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 22,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${_currentImageIndex + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '/${imgList.length}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 9 / 16,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            initialPage: widget.initialIndex,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: imgList
              .map(
                (item) => Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

// Страница с GridView
class GridViewPage extends StatefulWidget {
  final ThemeController themeController;

  const GridViewPage({Key? key, required this.themeController}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Постограмм',
          style: TextStyle(height: 20, fontSize: 30, fontFamily: 'Caveat'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 200,
                    child: Column(
                      children: CustomThemeMode.values.map((themeMode) {
                        return ListTile(
                          leading: Icon(
                            widget.themeController.themeMode == themeMode
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                          ),
                          title: Text(_themeModeToString(themeMode)),
                          onTap: () {
                            widget.themeController.setThemeMode(themeMode);
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarouselPage(initialIndex: index),
                ),
              );
            },
            child: GridTile(
              child: Image.asset(
                imgList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  String _themeModeToString(CustomThemeMode themeMode) {
    switch (themeMode) {
      case CustomThemeMode.light:
        return 'Светлая';
      case CustomThemeMode.dark:
        return 'Темная';
      case CustomThemeMode.reading:
        return 'Чтение';
      case CustomThemeMode.space:
        return 'Космос';
      default:
        return '';
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final themeStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(themeStorage: themeStorage);
  final themeController = ThemeController(themeRepository: themeRepository);

  runApp(MyApp(themeController: themeController));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;

  const MyApp({Key? key, required this.themeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: _getThemeMode(themeController.themeMode),
          home: GridViewPage(themeController: themeController),
        );
      },
    );
  }

  ThemeMode _getThemeMode(CustomThemeMode customThemeMode) {
    switch (customThemeMode) {
      case CustomThemeMode.light:
        return ThemeMode.light;
      case CustomThemeMode.dark:
        return ThemeMode.dark;
      case CustomThemeMode.reading:
        return ThemeMode.system; // Укажите свою тему, если необходимо
      case CustomThemeMode.space:
        return ThemeMode.system; // Укажите свою тему, если необходимо
      default:
        return ThemeMode.light;
    }
  }
}
