import 'package:flutter/material.dart';
import 'package:postogram/entity/photo_entity.dart';
import 'package:postogram/features/photo_scroll/widgets/head_board.dart';
import 'package:postogram/features/photo_scroll/widgets/photo_card.dart';
import 'package:postogram/features/photo_scroll/widgets/photo_carousel.dart';
import 'package:postogram/repository/photo_repository.dart';


class PhotoScrollScreen extends StatefulWidget {
  const PhotoScrollScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PhotoScrollScreenState();
}

class _PhotoScrollScreenState extends State<PhotoScrollScreen> {
  late Future<List<PhotoEntity>> _photos;
  late List<PhotoCard> _cards;

  @override
  void initState() {
    super.initState();
    _photos = PhotoRepository().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeadBoard(
        title: '21.02.2003',
        elements_amount: _cards.length,
      ),
    );
  }
}