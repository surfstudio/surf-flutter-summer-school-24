import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<StatefulWidget> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> _imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
  ];
  final int _allImages = 5;
  final int _currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Center(
          child: Text(
            "21.05.2023",
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Roboto',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                "${_currentImage + 1}/$_allImages",
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: _CarouselSlider(_imagePaths, _currentImage, setState),
      ),
    );
  }
}

class _CarouselSlider extends StatelessWidget {
  int _currentImage;
  final List<String> _imagePath;
  final Function callback;
  List<Container> images = [];

  _CarouselSlider(this._imagePath, this._currentImage, this.callback) {
    for (String path in _imagePath) {
      this.images.add(Container(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Image.asset(
                    path,
                    fit: BoxFit.fill,
                  )))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 900,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: true,
        enlargeFactor: 0.26,
        viewportFraction: 0.85,
      ),
      items: images,
    );
  }
}
