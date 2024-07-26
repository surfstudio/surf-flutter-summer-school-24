import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/di/dependency_injector.dart';
import 'package:surf_flutter_summer_school_24/domain/models/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';

class ImageCarouselScreen extends StatefulWidget {
  final List<AdvancedImage> images;
  final int initialIndex;

  const ImageCarouselScreen({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<StatefulWidget> createState() => _ImageCarouselScreenState();
}

class _ImageCarouselScreenState extends State<ImageCarouselScreen> {
  late ValueNotifier<int> _currentImageNotifier;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentImageNotifier = ValueNotifier<int>(widget.initialIndex);
    _pageController = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 0.8,
    );
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _currentImageNotifier.dispose();
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  void _onPageChanged() {
    try {
      final page = _pageController.page?.round() ?? widget.initialIndex;
      if (_currentImageNotifier.value != page) {
        _currentImageNotifier.value = page;
      }
    } catch (e) {
      debugPrint('Error on page change: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка при изменении страницы')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeController = DependencyInjector().themeController;

    if (widget.images.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('Нет доступных изображений'),
        ),
      );
    }

    return Scaffold(
      appBar: CarouselHeader(
        currentImageNotifier: _currentImageNotifier,
        allImages: widget.images.length,
        themeController: themeController,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 72),
        child: Center(
          child: ValueListenableBuilder<int>(
            valueListenable: _currentImageNotifier,
            builder: (context, currentPage, child) {
              return ImageCarousel(
                images: widget.images,
                pageController: _pageController,
                currentPage: currentPage,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CarouselHeader extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<int> currentImageNotifier;
  final int allImages;
  final ThemeController themeController;

  const CarouselHeader({
    super.key,
    required this.currentImageNotifier,
    required this.allImages,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

    return ValueListenableBuilder<int>(
      valueListenable: currentImageNotifier,
      builder: (context, currentImage, child) {
        return AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "21.05.2023",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Center(
                child: Text(
                  "${currentImage + 1}/$allImages",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
            )
          ],
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ImageCarousel extends StatelessWidget {
  final List<AdvancedImage> images;
  final PageController pageController;
  final int currentPage;

  const ImageCarousel({
    super.key,
    required this.images,
    required this.pageController,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      itemBuilder: (context, index) {
        final scale = currentPage == index ? 1.0 : 0.9;
        return AnimatedScale(
          scale: scale,
          duration: const Duration(milliseconds: 300),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: 'image-${images[index].path}',
                  child: images[index].image,
                ),
                if (currentPage != index)
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
