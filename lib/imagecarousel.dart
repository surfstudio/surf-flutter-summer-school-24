import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> _imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
  ];

  final PageController _pageController = PageController(
    viewportFraction: 0.7,
  );

  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final int initialPage = _imagePaths.length * 100;
      _pageController.jumpToPage(initialPage);
    });

    _pageController.addListener(() {
      final page = _pageController.page;
      if (page != null) {
        final int newPage = (page.round() % _imagePaths.length + _imagePaths.length) % _imagePaths.length;
        if (_currentPageNotifier.value != newPage) {
          _currentPageNotifier.value = newPage;
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {

          },
        ),
        title: Center(
          child: Text(
            "21.05.2023",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        actions: [
          ValueListenableBuilder<int>(
            valueListenable: _currentPageNotifier,
            builder: (context, currentPage, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    "${currentPage + 1}/${_imagePaths.length}",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              );
            },
          ),
        ],
        elevation: 0,
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: null,
        itemBuilder: (context, index) {
          final adjustedIndex = index % _imagePaths.length;
          return _buildPage(_imagePaths[adjustedIndex], adjustedIndex);
        },
        onPageChanged: (index) {
          final adjustedIndex = index % _imagePaths.length;
          _currentPageNotifier.value = adjustedIndex;
        },
      ),
    );
  }

  Widget _buildPage(String imagePath, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        final page = _pageController.hasClients ? _pageController.page : null;

        if (page == null) {
          return Container();
        }

        final difference = (index - (page ?? 0)).abs();
        final scale = (1 - difference * 0.3).clamp(0.7, 1.0);
        final blur = (difference * 10).clamp(0.0, 10.0);

        return Center(
          child: Transform.scale(
            scale: scale,
            child: ClipRect(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: (index == _currentPageNotifier.value ? 0.0 : blur.toDouble()),
                        sigmaY: (index == _currentPageNotifier.value ? 0.0 : blur.toDouble()),
                      ),
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
