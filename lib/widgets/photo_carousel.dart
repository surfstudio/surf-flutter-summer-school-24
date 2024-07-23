import 'package:flutter/material.dart';
import 'dart:ui';

class PhotoCarousel extends StatefulWidget {
  final List<String> imgList;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const PhotoCarousel({
    required this.imgList,
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
  late List<Future<void>> _imageFutures;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.currentIndex,
      viewportFraction: _viewportFraction,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _imageFutures = widget.imgList
          .map((url) => precacheImage(NetworkImage(url), context))
          .toList();
      _isInitialized = true;
    }
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
        itemCount: widget.imgList.length,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, index) {
          return _buildCarouselItem(index);
        },
      ),
    );
  }

  Widget _buildCarouselItem(int index) {
    return FutureBuilder<void>(
      future: _imageFutures[index],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildImageItem(index);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildImageItem(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double scale = 1.0;
        if (_pageController.position.haveDimensions) {
          double pageOffset =
              _pageController.page ?? _pageController.initialPage.toDouble();
          scale = (1 - (pageOffset - index).abs() * 0.2).clamp(0.8, 1.0);
        }
        return Transform.scale(
          scale: scale,
          child: child,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: _margin, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                widget.imgList[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.error)),
              ),
              if (index != widget.currentIndex)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(color: Colors.black.withOpacity(0.1)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
