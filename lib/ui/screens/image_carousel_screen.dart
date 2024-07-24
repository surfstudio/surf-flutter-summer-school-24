import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:surf_flutter_summer_school_24/di/dependency_injector.dart';
import '../../domain/models/theme_controller.dart';

class ImageCarouselScreen extends StatefulWidget {
  final List<String> imageUrls;  // Изменено на imageUrls
  final int initialIndex;

  const ImageCarouselScreen({
    super.key,
    required this.imageUrls,
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
    _pageController = PageController(initialPage: widget.initialIndex, viewportFraction: 0.8);
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
    final page = _pageController.page?.round() ?? widget.initialIndex;
    if (_currentImageNotifier.value != page) {
      _currentImageNotifier.value = page;
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeController = DependencyInjector().themeController;

    return Scaffold(
      appBar: CarouselHeader(
        currentImageNotifier: _currentImageNotifier,
        allImages: widget.imageUrls.length,
        themeController: themeController,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 72),
        child: Center(
          child: ValueListenableBuilder<int>(
            valueListenable: _currentImageNotifier,
            builder: (context, currentPage, child) {
              return ImageCarousel(
                imageUrls: widget.imageUrls,
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
  final List<String> imageUrls;  // Изменено на imageUrls
  final PageController pageController;
  final int currentPage;

  const ImageCarousel({
    super.key,
    required this.imageUrls,
    required this.pageController,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: imageUrls.length,
      itemBuilder: (context, index) {
        final scale = currentPage == index ? 1.0 : 0.9;
        return Transform.scale(
          scale: scale,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  imageUrls[index],  // Заменено на Image.network
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.error, color: Colors.red));
                  },
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
