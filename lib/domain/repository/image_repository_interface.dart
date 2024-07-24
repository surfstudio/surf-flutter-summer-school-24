import 'package:surf_flutter_summer_school_24/entity/image_entity.dart';

abstract interface class IImageRepository {
  Future<List<ImageEntity>> getPhotos();
}
