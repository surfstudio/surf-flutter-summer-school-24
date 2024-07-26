import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/image_repository.dart';
import 'package:flutter/material.dart';

class MockImageRepository implements ImageRepository {
  int _idCounter = 1;

  @override
  Future<List<AdvancedImage>> getImages() async {

    return [
      AdvancedImage(
          image: Image.network("https://downloader.disk.yandex.ru/preview/0e0e6c11a061f81770bb0224ebb1078d5a2b4f2d926b9841461f903bc3743655/inf/3G4zqvB02_nV558b4mvEnhLOwGS4yUNCOlTvGtIIaug397POO1oF89-eUET7c-dx7PTW3ZCFwcE717Ng-1jjxw%3D%3D?uid=156916995&filename=image.png&disposition=inline&hash=&limit=0&content_type=image%2Fpng&owner_uid=156916995&tknv=v2&size=S&crop=0"),
          id: "id:${_idCounter++}"),
      AdvancedImage(
          image: Image.network("https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}"),
      AdvancedImage(
          image: Image.network("https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}"),
      AdvancedImage(
          image: Image.network("https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}"),
      AdvancedImage(
          image: Image.network("https://basik.ru/images/nature_landscape_9/30_nature.jpg"),
          id: "id:${_idCounter++}")
    ];
  }
}
