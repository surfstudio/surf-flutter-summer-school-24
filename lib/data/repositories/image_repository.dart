import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';

abstract interface class ImageRepository {
  Future<List<AdvancedImage>> getImages();
}
