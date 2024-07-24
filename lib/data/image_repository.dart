import 'package:surf_flutter_summer_school_24/domain/model/advanced_image.dart';

abstract interface class ImageRepository {
  Future<List<AdvancedImage>> getImage();
}
