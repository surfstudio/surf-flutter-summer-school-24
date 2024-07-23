import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    '03.01.2025',
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
  const GridViewPage({super.key, required this.onThemeChanged});

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
          style: TextStyle(height: 20, fontSize: 30, fontFamily: 'italic'),//TODO: заменить шрифт
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.brightness_6),
                          title: const Text('Темная тема'),
                          onTap: () {
                            widget.onThemeChanged(ThemeMode.dark);
                            Navigator.pop(context);
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.brightness_7),
                          title: const Text('Светлая тема'),
                          onTap: () {
                            widget.onThemeChanged(ThemeMode.light);
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
                imgList[index],
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
        '/': (context) => GridViewPage(onThemeChanged: _toggleTheme),
        '/carousel': (context) => const CarouselPage(initialIndex: 0),
      },
    );
  }
}
