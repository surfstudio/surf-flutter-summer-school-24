import 'dart:async';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/di/dependency_injector.dart';
import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/utils/utils.dart';
import 'image_carousel_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<bool> _imagesLoaded = ValueNotifier<bool>(false);
  ValueNotifier<List<AdvancedImage>> _imagesNotifier =
      ValueNotifier<List<AdvancedImage>>([]);
  Timer? _timer;
  int _attemptsCounter = 0;

  @override
  void initState() {
    super.initState();
    _loadImages();
    _startPeriodicImageLoad();
  }

  void _startPeriodicImageLoad() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
      if (_imagesLoaded.value == false && _attemptsCounter > 4) {
        _attemptsCounter = 0;
        _imagesLoaded.value = true;
      }
      _attemptsCounter++;
      _loadImages();
    });
  }

  Future<void> _loadImages() async {
    final interactor = DependencyInjector().advancedImageInteractor;
    try {
      final images = await interactor.getAdvancedImages();
      if (_imagesNotifier.value != images) {
        _imagesNotifier.value = images;
      }
      _imagesLoaded.value = true;
    } catch (error) {
      debugPrint('Error loading images: $error');
      _imagesLoaded.value = false;
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _imagesLoaded.dispose();
    _imagesNotifier.dispose();
    super.dispose();
  }

  void _showBottomSheet() {
    final themeController = DependencyInjector().themeController;

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
                onTap: () {
                  Navigator.pop(context);
                  _showImageSourceOptions();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showImageSourceOptions() {
    final themeController = DependencyInjector().themeController;

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
                leading: Icon(Icons.camera_alt, color: textColor),
                title: Text(
                  'Из камеры',
                  style: TextStyle(fontSize: 18, color: textColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Utils.getImageFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: textColor),
                title: Text(
                  'Из галереи',
                  style: TextStyle(fontSize: 18, color: textColor),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Utils.getImageFromGalery();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _getThemeImage(String imageName) {
    final themeController = DependencyInjector().themeController;
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
      body: ValueListenableBuilder<bool>(
        valueListenable: _imagesLoaded,
        builder: (context, isLoaded, child) {
          final themeController = DependencyInjector().themeController;

          return ValueListenableBuilder<List<AdvancedImage>>(
            valueListenable: _imagesNotifier,
            builder: (context, images, child) {
              return isLoaded
                  ? images.isNotEmpty
                      ? ImageGrid(
                          isBlurred: images.isEmpty,
                          isDarkMode:
                              themeController.themeMode.value == ThemeMode.dark,
                          images: images,
                          onImageTap: (index) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageCarouselScreen(
                                  initialIndex: index,
                                  images: images,
                                ),
                              ),
                            );
                          },
                        )
                      : ErrorView(imagesLoaded: _imagesLoaded)
                  : Center(child: CircularProgressIndicator());
            },
          );
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
    final themeController = DependencyInjector().themeController;
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

class ImageGrid extends StatefulWidget {
  final bool isBlurred;
  final bool isDarkMode;
  final List<AdvancedImage> images;
  final Function(int) onImageTap;

  const ImageGrid({
    super.key,
    required this.isBlurred,
    required this.isDarkMode,
    required this.images,
    required this.onImageTap,
  });

  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  List<int> _selectedIndexes = [];
  double _crossAxisCount = 3.0;
  double _minCrossAxisCount = 2.0;
  double _maxCrossAxisCount = 6.0;
  double _lastScale = 1.0;
  bool _isScaling = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        _isScaling = true;
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        const double scaleThreshold = 0.01;

        setState(() {
          if (_isScaling &&
              (details.scale - _lastScale).abs() > scaleThreshold) {
            _crossAxisCount = (_crossAxisCount * details.scale / _lastScale)
                .clamp(_minCrossAxisCount, _maxCrossAxisCount);
            _lastScale = details.scale;
          }
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        _isScaling = false;
        _lastScale = 1.0;
      },
      child: Stack(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _crossAxisCount.toInt(),
              crossAxisSpacing: 3,
              mainAxisSpacing: 5,
            ),
            itemCount: widget.isBlurred ? 40 : widget.images.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedIndexes.contains(index);
              return GestureDetector(
                onLongPress: () {
                  setState(() {
                    if (!_selectedIndexes.contains(index)) {
                      _selectedIndexes.add(index);
                    }
                  });
                },
                onTap: () {
                  if (_selectedIndexes.isEmpty) {
                    widget.onImageTap(index);
                  } else {
                    setState(() {
                      if (isSelected) {
                        _selectedIndexes.remove(index);
                      } else {
                        _selectedIndexes.add(index);
                      }
                    });
                  }
                },
                child: Stack(
                  children: [
                    Hero(
                      tag: 'image-${widget.images[index].path}',
                      child: Container(
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border.all(
                                  color: Colors.blue,
                                  width: 3,
                                )
                              : null,
                        ),
                        child: widget.isBlurred
                            ? Image.asset('assets/blurred.png',
                                fit: BoxFit.fill)
                            : widget.images[index].image,
                      ),
                    ),
                    if (isSelected)
                      const Positioned(
                        top: 8,
                        right: 8,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          if (_selectedIndexes.isNotEmpty)
            Positioned(
              bottom: 16,
              right: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    onPressed: _cancelSelection,
                    child: const Icon(Icons.cancel),
                  ),
                  const SizedBox(width: 16),
                  FloatingActionButton(
                    onPressed: _deleteSelectedImages,
                    child: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _deleteSelectedImages() async {
    final imagesToRemove = List.of(_selectedIndexes);

    for (final index in imagesToRemove) {
      final imagePath = widget.images[index].path;
      await Utils.deleteImage(imagePath);
    }

    setState(() {
      _selectedIndexes.sort((a, b) => b.compareTo(a));
      for (final index in _selectedIndexes) {
        widget.images.removeAt(index);
      }
      _selectedIndexes.clear();
    });
  }

  void _cancelSelection() {
    setState(() {
      _selectedIndexes.clear();
    });
  }
}

class ErrorView extends StatelessWidget {
  final ValueNotifier<bool> imagesLoaded;

  const ErrorView({super.key, required this.imagesLoaded});

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
              imagesLoaded.value = false;
            },
            child: const Text('Попробовать снова'),
          ),
        ],
      ),
    );
  }
}
