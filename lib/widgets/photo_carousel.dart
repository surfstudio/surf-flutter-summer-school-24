import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';

class PhotoCarousel extends StatefulWidget {
  final List<CachedNetworkImageProvider> imageProviders;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const PhotoCarousel({
    required this.imageProviders,
    required this.currentIndex,
    required this.onPageChanged,
    super.key,
  });

  @override
  _PhotoCarouselState createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  late PageController _pageController;
  final double _viewportFraction = 0.75;
  final double _margin = 8.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.currentIndex,
      viewportFraction: _viewportFraction,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
      });
    });
  }

  @override
  void didUpdateWidget(PhotoCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentIndex != oldWidget.currentIndex) {
      _pageController.animateToPage(
        widget.currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: PageView.builder(
        controller: _pageController,
        itemCount: widget.imageProviders.length,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) {
          return CarouselItem(
            imageProvider: widget.imageProviders[index],
            isCurrentIndex: index == widget.currentIndex,
            pageController: _pageController,
            index: index,
            margin: _margin,
          );
        },
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final CachedNetworkImageProvider imageProvider;
  final bool isCurrentIndex;
  final PageController pageController;
  final int index;
  final double margin;

  const CarouselItem({
    super.key,
    required this.imageProvider,
    required this.isCurrentIndex,
    required this.pageController,
    required this.index,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return ScaledImageItem(
      imageProvider: imageProvider,
      isCurrentIndex: isCurrentIndex,
      pageController: pageController,
      index: index,
      margin: margin,
    );
  }
}

class ScaledImageItem extends StatelessWidget {
  final CachedNetworkImageProvider imageProvider;
  final bool isCurrentIndex;
  final PageController pageController;
  final int index;
  final double margin;

  const ScaledImageItem({
    super.key,
    required this.imageProvider,
    required this.isCurrentIndex,
    required this.pageController,
    required this.index,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double scale = 1.0;
        if (pageController.position.haveDimensions) {
          double pageOffset =
              pageController.page ?? pageController.initialPage.toDouble();
          scale = (1 - (pageOffset - index).abs() * 0.2).clamp(0.8, 1.0);
        }
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: ImageContainer(
        imageProvider: imageProvider,
        isCurrentIndex: isCurrentIndex,
        margin: margin,
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final CachedNetworkImageProvider imageProvider;
  final bool isCurrentIndex;
  final double margin;

  const ImageContainer({
    super.key,
    required this.imageProvider,
    required this.isCurrentIndex,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin, right: margin, top: 56, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: imageProvider,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Stack(
                fit: StackFit.expand,
                children: [
                  // Серая картинка в качестве фона при ошибке
                  Container(
                  ),
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 60.0),
                        SizedBox(height: 16),
                        Text(
                          'Ошибка загрузки изображения',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!isCurrentIndex && imageProvider.errorListener == null)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 0.0),
                child: Container(),
              ),
          ],
        ),
      ),
    );
  }
}
