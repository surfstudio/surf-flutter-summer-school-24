import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

final Set<String> imgList = {
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
};

class CarouselPage extends StatefulWidget {
  final int initialIndex;
  const CarouselPage({super.key, required this.initialIndex});

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
                    fontSize: 22), // Установите общий размер текста здесь
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
              .map((item) => Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class GridViewPage extends StatefulWidget {
  final ValueChanged<ThemeMode> onThemeChanged;
  final ThemeMode currentThemeMode;
  const GridViewPage({super.key, required this.onThemeChanged, required this.currentThemeMode});

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
          style: TextStyle(height: 20, fontSize: 30, fontFamily: 'Caveat'),//TODO: заменить шрифт
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(widget.currentThemeMode == ThemeMode.light
                              ? Icons.light_mode
                              : Icons.dark_mode),
                          title: Text('Тема'), 
                          trailing: Text(widget.currentThemeMode == ThemeMode.light ? 'Светлая':'Темная',
                          style: const TextStyle(fontSize: 20.0,)),
                          onTap: () {
                            widget.onThemeChanged(widget.currentThemeMode == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light);
                            Navigator.pop(context);
                          },
                        ),
                      ],
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
                imgList.toList()[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => GridViewPage(
              onThemeChanged: _toggleTheme,
              currentThemeMode: _themeMode,
            ),
        '/carousel': (context) => CarouselPage(initialIndex: 0),
      },
    );
  }
}
