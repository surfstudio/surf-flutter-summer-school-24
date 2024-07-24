import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/data/entity/image_entity.dart';
import 'package:surf_flutter_summer_school_24/data/repositiry/mock_image_repository.dart';

class GridPageModel extends ElementaryModel {
  final MockImageRepository imageRepository;
  final ValueNotifier<List<ImageEntity>> images = ValueNotifier([]);

  GridPageModel(this.imageRepository);

  Future<List<ImageEntity>> getImageStream(String chatId) {
    return imageRepository.getPhotos();
  }
}
