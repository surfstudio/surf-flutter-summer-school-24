import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/photo_scroll/widgets/head_board.dart';
import 'package:surf_flutter_summer_school_24/features/photo_scroll/widgets/photo_carousel.dart';

import '../../../data/photo.dart';
import '../widgets/photo_card.dart';

class PhotoScrollScreen extends StatelessWidget {
  final List<PhotoCard> cards = [
    PhotoCard(photo: Photo(path: 'assets/images/image_1.jpg')),
    PhotoCard(photo: Photo(path: 'assets/images/image_1.jpg'))
  ];

  PhotoScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeadBoard(title: '21.02.2003'),
      body: PhotoCarousel(
        cards: cards,
      ),
    );
  }
}
