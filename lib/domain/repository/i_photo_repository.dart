import 'package:surf_flutter_summer_school_24/domain/model/image_model.dart';

abstract interface class IPhotoRepository {
  Future<List<ImageModel>> getPhotos();
}
