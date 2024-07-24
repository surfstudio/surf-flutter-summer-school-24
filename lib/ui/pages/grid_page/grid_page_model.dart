import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/data/repositiry/mock_image_repository.dart';
import 'package:surf_flutter_summer_school_24/entity/image_entity.dart';

class GridPageModel extends ElementaryModel {
  final MockImageRepository imageRepository;
  final images = ValueNotifier<List<ImageEntity>>([]);

  GridPageModel(this.imageRepository);

  Future<List<ImageEntity>> getImageStream(String chatId) {
    return imageRepository.getPhotos();
  }

  @override
  void dispose() {
    images.dispose();
    super.dispose();
  }
}
