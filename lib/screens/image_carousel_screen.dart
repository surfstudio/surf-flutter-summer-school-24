import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:ui';

void main() {
  runApp(const MaterialApp(home: ImageCarouselScreen()));
}

class ImageCarouselScreen extends StatefulWidget {
  const ImageCarouselScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ImageCarouselScreenState();
}

class _ImageCarouselScreenState extends State<ImageCarouselScreen> {
  final List<String> _imagePaths = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
  ];
  final int _allImages = 5;
  int _currentImage = 0;

  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CarouselHeader(
        currentImage: _currentImage,
        allImages: _allImages,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 72),
        child: Center(
          child: ImageCarousel(
            imagePaths: _imagePaths,
            carouselController: _carouselController,
            onPageChanged: (index) {
              setState(() {
                _currentImage = index;
              });
            },
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
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {},
      ),
      title: const Text(
        "21.05.2023",
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Roboto',
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Center(
            child: Text(
              "${currentImage + 1}/$allImages",
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ImageCarousel extends StatelessWidget {
  final List<String> imagePaths;
  final CarouselController carouselController;
  final ValueChanged<int> onPageChanged;

  const ImageCarousel({
    super.key,
    required this.imagePaths,
    required this.carouselController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: imagePaths.length,
      itemBuilder: (context, index, realIndex) {
        bool isCenter = index == context.findAncestorStateOfType<_ImageCarouselScreenState>()!._currentImage;
        return ClipRRect(
          borderRadius: BorderRadius.circular(35.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              if (!isCenter)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
            ],
          ),
        );
      },
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: true,
        initialPage: 0,
        enableInfiniteScroll: true,
        viewportFraction: 0.832,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {
          onPageChanged(index);
        },
      ),
    );
  }
}
