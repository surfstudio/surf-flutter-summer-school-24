import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/image_repository.dart';
import 'package:flutter/material.dart';

class MockImageRepository implements ImageRepository {
  int _idCounter = 1;

  @override
  Future<List<AdvancedImage>> getImages() async {
    return [
      AdvancedImage(
          image: Image.network(
              "https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}",
          path: "placeholder",
          createdAt: DateTime.now()),
      AdvancedImage(
          image: Image.network(
              "https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}",
          path: "placeholder",
          createdAt: DateTime.now()),
      AdvancedImage(
          image: Image.network(
              "https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}",
          path: "placeholder",
          createdAt: DateTime.now()),
      AdvancedImage(
          image: Image.network(
              "https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}",
          path: "placeholder",
          createdAt: DateTime.now()),
      AdvancedImage(
          image: Image.network(
              "https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}",
          path: "placeholder",
          createdAt: DateTime.now())
    ];
  }
}
