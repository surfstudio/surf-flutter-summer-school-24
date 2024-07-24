import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:surf_flutter_summer_school_24/domain/interactors/advanced_image_interactor.dart';
import 'package:surf_flutter_summer_school_24/domain/model/advanced_image.dart';

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
  int _allImages = 1;
  int _currentImage = 0;

  late final PageController _pageController =
  PageController(initialPage: _allImages * 1000, viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
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
    _currentImage =
        (_pageController.page?.round() ?? _currentImage) % _allImages;
    if (prevPage != _currentImage) {
      setState(() {});
    }
  }

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
            pageController: _pageController,
            currentPage: _currentImage,
            allImages: _allImages,
          ),
        ),
      ),
    );
  }
}

class CarouselHeader extends StatelessWidget implements PreferredSizeWidget {
  int currentImage;
  int allImages;

  CarouselHeader({
    super.key,
    required this.currentImage,
    required this.allImages,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme
        .of(context)
        .brightness == Brightness.dark;

    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        onPressed: () {},
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
  int currentPage;
  int allImages;

  ImageCarousel({
    super.key,
    required this.imagePaths,
    required this.pageController,
    required this.currentPage,
    required this.allImages
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  List<AdvancedImage>? aImages;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AdvancedImageInteractor().getAdvancedImages(),
        builder: (_, AsyncSnapshot snapshot) {
          print(snapshot.hasData);
          if (!snapshot.hasData) {
            widget.allImages = 9;
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          aImages = snapshot.data;
          return PageView.builder(
            controller: widget.pageController,
            itemCount: widget.imagePaths.length * 2000,
            itemBuilder: (context, index) {
              final realIndex = index % widget.imagePaths.length;
              final scale = widget.currentPage == realIndex ? 1.0 : 0.9;
              return Transform.scale(
                scale: scale,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(aImages![index].url),
                      if (widget.currentPage != realIndex)
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
        });
  }
}

// class ImageCarousel extends StatelessWidget {
//   final List<String> imagePaths;
//   final PageController pageController;
//   final int currentPage;
//   final AdvancedImageInteractor advancedImageInteractor = AdvancedImageInteractor();
//   Image image = Image.asset("assets/blurred.png", fit: BoxFit.cover);
//
//
//   ImageCarousel({
//     super.key,
//     required this.imagePaths,
//     required this.pageController,
//     required this.currentPage,
//   }) {
//     image = Image.network(advancedImageInteractor.advancedImage.url);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: pageController,
//       itemCount: imagePaths.length * 2000,
//       itemBuilder: (context, index) {
//         final realIndex = index % imagePaths.length;
//         final scale = currentPage == realIndex ? 1.0 : 0.9;
//         return Transform.scale(
//           scale: scale,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(35.0),
//             child: Stack(
//               fit: StackFit.expand,
//               children: [
//                 image,
//                 if (currentPage != realIndex)
//                   BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                     child: Container(
//                       color: Colors.black.withOpacity(0),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
