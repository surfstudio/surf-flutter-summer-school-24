import 'package:surf_flutter_summer_school_24/storage/photos/photo_entity.dart';

class MockPhotoRepository implements IPhotoRepository {
  @override
    Future<List<PhotoEntity>> getPhotos() async {
      return [
        PhotoEntity(
          id: 1,
          url: '1',
        ),
        PhotoEntity(
          id: 2,
          url: '2',
        ),
        PhotoEntity(
          id: 3,
          url: '3',
        ),
      ];
    }
}