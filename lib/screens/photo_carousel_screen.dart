import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/widgets/appbars/photo_carousel_app_bar.dart';
import '/widgets/photo_carousel.dart';

class PhotoCarouselScreen extends StatefulWidget {
  final List<CachedNetworkImageProvider> imageProviders;
  final int initialIndex;

  const PhotoCarouselScreen({
    super.key,
    required this.imageProviders,
    required this.initialIndex,
  });

  @override
  _PhotoCarouselScreenState createState() => _PhotoCarouselScreenState();
}

class _PhotoCarouselScreenState extends State<PhotoCarouselScreen> {
  late int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        currentIndex: _current,
        totalImages: widget.imageProviders.length,
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      body: PhotoCarousel(
        imageProviders: widget.imageProviders,
        currentIndex: _current,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }
}
