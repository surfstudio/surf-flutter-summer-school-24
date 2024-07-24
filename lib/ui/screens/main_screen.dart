import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/di/theme_inherited.dart';
import 'image_carousel_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<bool> _loadImages() async {
    await Future.delayed(const Duration(seconds: 2));
    return Future.value(true); // is loading success
  }

  void _showBottomSheet() {
    final themeController = ThemeInherited.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        final isDarkMode = themeController.themeMode.value == ThemeMode.dark;
        final textColor = isDarkMode ? Colors.white : Colors.black;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Image.asset(_getThemeImage('theme')),
                title: Text(
                  'Тема',
                  style: TextStyle(fontSize: 18, color: textColor),
                ),
                trailing: ValueListenableBuilder<ThemeMode>(
                  valueListenable: themeController.themeMode,
                  builder: (context, themeMode, child) {
                    return Text(
                      themeMode == ThemeMode.light ? 'Светлая' : 'Темная',
                      style: TextStyle(fontSize: 18, color: textColor),
                    );
                  },
                ),
                onTap: () async {
                  await themeController.switchThemeMode();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset(_getThemeImage('upload')),
                title: Text(
                  'Загрузить фото',
                  style: TextStyle(fontSize: 18, color: textColor),
                ),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }

  String _getThemeImage(String imageName) {
    final themeController = ThemeInherited.of(context);
    final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

    switch (imageName) {
      case 'theme':
        return isDarkMode ? 'assets/theme_light.png' : 'assets/theme.png';
      case 'upload':
        return isDarkMode ? 'assets/upload_light.png' : 'assets/upload.png';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainScreenAppBar(onOptionsPressed: _showBottomSheet),
      body: FutureBuilder<bool>(
        future: _loadImages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ImageGrid(
              isBlurred: true,
              isDarkMode: ThemeInherited.of(context).themeMode.value == ThemeMode.dark,
              onImageTap: (index) {
                // Do nothing when blurred
              },
            );
          } else if (snapshot.hasError || !snapshot.hasData || !snapshot.data!) {
            return const ErrorView();
          } else {
            return ImageGrid(
              isBlurred: false,
              isDarkMode: ThemeInherited.of(context).themeMode.value == ThemeMode.dark,
              onImageTap: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageCarouselScreen(
                      initialIndex: index,
                      imagePaths: List.generate(30, (index) => 'assets/image1.jpg'),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class MainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onOptionsPressed;

  const MainScreenAppBar({super.key, required this.onOptionsPressed});

  @override
  Widget build(BuildContext context) {
    final themeController = ThemeInherited.of(context);
    final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

    return AppBar(
      title: Container(
        margin: const EdgeInsets.fromLTRB(0, 11, 0, 11),
        child: Image.asset(
          isDarkMode ? 'assets/logo_light.png' : 'assets/logo.png',
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Image.asset(
            isDarkMode ? 'assets/options_light.png' : 'assets/options.png',
          ),
          onPressed: onOptionsPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ImageGrid extends StatelessWidget {
  final bool isBlurred;
  final bool isDarkMode;
  final List<String> _loadedImages = List.generate(30, (index) => 'assets/image1.jpg');
  final Function(int) onImageTap;

  ImageGrid({super.key, required this.isBlurred, required this.isDarkMode, required this.onImageTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 5,
      ),
      itemCount: isBlurred ? 40 : _loadedImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => onImageTap(index),
          child: Image.asset(
            isBlurred ? 'assets/blurred.png' : _loadedImages[index % _loadedImages.length],
            fit: BoxFit.fill,
          ),
        );
      },
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/smile.png'),
          const SizedBox(height: 16),
          Text(
            'Упс!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Произошла ошибка.\nПопробуйте снова.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text('Попробовать снова'),
          ),
        ],
      ),
    );
  }
}
