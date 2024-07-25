import 'models/photo_entity.dart';

abstract interface class IPhotoRepository {
  Future<List<PhotoEntity>> getPhotos();
}