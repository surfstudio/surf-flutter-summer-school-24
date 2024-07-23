import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/photo_carousel.dart';
import '../data/image_data.dart';

class PhotoGalleryScreen extends StatefulWidget {
  const PhotoGalleryScreen({super.key});

  @override
  _PhotoGalleryScreenState createState() => _PhotoGalleryScreenState();
}

class _PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        currentIndex: _current,
        totalImages: imgList.length,
      ),
      body: PhotoCarousel(
        imgList: imgList,
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
