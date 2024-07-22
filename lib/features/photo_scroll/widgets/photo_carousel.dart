import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/photo_scroll/widgets/photo_card.dart';

class PhotoCarousel extends StatelessWidget {
  final List<PhotoCard> cards;

  const PhotoCarousel({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeFactor: 0.2,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
      ),
      items: cards,
    );
  }
}
