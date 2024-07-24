import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:surf_flutter_summer_school_24/domain/interactors/advanced_image_interactor.dart';
import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';

class ImageCarouselScreen extends StatefulWidget {
  final List<String> imagePaths;
  final int initialIndex;

  const ImageCarouselScreen({
    super.key,
    required this.imagePaths,
    required this.initialIndex,
  });

  @override
  State<StatefulWidget> createState() => _ImageCarouselScreenState();
}

class _ImageCarouselScreenState extends State<ImageCarouselScreen> {
  late int _currentImage;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentImage = widget.initialIndex;
    _pageController = PageController(initialPage: _currentImage, viewportFraction: 0.8);
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final prevPage = _currentImage;
    _currentImage = _pageController.page?.round() ?? _currentImage;
    if (prevPage != _currentImage) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarouselHeader(
        currentImage: _currentImage,
        allImages: widget.imagePaths.length,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 72),
        child: Center(
          child: ImageCarousel(
            imagePaths: widget.imagePaths,
            pageController: _pageController,
            currentPage: _currentImage,
          ),
        ),
      ),
    );
  }
}

class CarouselHeader extends StatelessWidget implements PreferredSizeWidget {
  final int currentImage;
  final int allImages;

  const CarouselHeader({
    super.key,
    required this.currentImage,
    required this.allImages,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

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
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ImageCarousel extends StatefulWidget {
  final List<String> imagePaths;
  final PageController pageController;
  final int currentPage;

  const ImageCarousel({
    super.key,
    required this.imagePaths,
    required this.pageController,
    required this.currentPage,
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      itemCount: widget.imagePaths.length,
      itemBuilder: (context, index) {
        final scale = widget.currentPage == index ? 1.0 : 0.9;
        return Transform.scale(
          scale: scale,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(widget.imagePaths[index], fit: BoxFit.cover),
                if (widget.currentPage != index)
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
