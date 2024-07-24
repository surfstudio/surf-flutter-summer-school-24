import 'package:surf_flutter_summer_school_24/domain/model/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/data/image_repository.dart';

class MockImageRepository implements ImageRepository {
  int _idCounter = 1;

  @override
  Future<List<AdvancedImage>> getImage() async {
    return [
      AdvancedImage(
          url: "https://basik.ru/images/nature_landscape_9/30_nature.jpg",
          id: "id:${_idCounter++}"),
      AdvancedImage(
          url: "https://basik.ru/images/nature_landscape_9/30_nature.jpg",
          id: "id:${_idCounter++}"),
      AdvancedImage(
          url: "https://basik.ru/images/nature_landscape_9/30_nature.jpg",
          id: "id:${_idCounter++}"),
      AdvancedImage(
          url: "https://basik.ru/images/nature_landscape_9/30_nature.jpg",
          id: "id:${_idCounter++}"),
      AdvancedImage(
          url: "https://basik.ru/images/nature_landscape_9/30_nature.jpg",
          id: "id:${_idCounter++}")
    ];
  }
}
