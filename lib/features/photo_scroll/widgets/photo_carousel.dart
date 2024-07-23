import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/photo_scroll/widgets/photo_card.dart';

class PhotoCarousel extends StatelessWidget {
  final List<PhotoCard> _cards;
  final ValueNotifier<int> currentPhotoIndexNotifier;

  const PhotoCarousel({super.key, required List<PhotoCard> cards, required this.currentPhotoIndexNotifier}) : _cards = cards;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 650,
        viewportFraction: 0.85,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          currentPhotoIndexNotifier.value = index + 1;
        }
      ),
      items: _cards,
    );
  }
}
