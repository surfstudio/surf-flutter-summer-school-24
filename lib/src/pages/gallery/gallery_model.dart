import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import '../../feature/photos/data/i_photo_repository.dart';
import '../../models/photo_entity.dart';

class GalleryModel extends ElementaryModel {
  final IPhotoRepository photoRepository;
  final ValueNotifier<List<PhotoEntity>> images = ValueNotifier([]); // Используем ValueNotifier

  GalleryModel(this.photoRepository);

  Future<void> fetchPhotos() async {
    final photos = await photoRepository.getPhotos();
    images.value = photos; // Обновляем ValueNotifier
  }
}