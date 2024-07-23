import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/photo_scroll/widgets/head_board.dart';
import 'package:surf_flutter_summer_school_24/features/photo_scroll/widgets/photo_carousel.dart';

import '../../../data/photo.dart';
import '../widgets/photo_card.dart';

class PhotoScrollScreen extends StatelessWidget {
  final List<PhotoCard> _cards = [
    PhotoCard(photo: Photo(path: 'assets/images/image_1.jpg')),
    PhotoCard(photo: Photo(path: 'assets/images/image_2.jpg')),
    PhotoCard(photo: Photo(path: 'assets/images/image_3.jpg')),
    PhotoCard(photo: Photo(path: 'assets/images/image_4.jpg')),
    PhotoCard(photo: Photo(path: 'assets/images/image_5.jpg')),
  ];
  final ValueNotifier<int> currentPhotoIndexNotifier = ValueNotifier<int>(1);

  PhotoScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadBoard(
          title: '21.02.2003',
          photoListSize: _cards.length,
          currentPhotoIndexNotifier: currentPhotoIndexNotifier),
      body: PhotoCarousel(
        cards: _cards,
        currentPhotoIndexNotifier: currentPhotoIndexNotifier,
      ),
    );
  }
}
