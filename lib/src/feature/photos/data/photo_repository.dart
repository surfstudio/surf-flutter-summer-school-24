import '../domain/i_photo_repository.dart';
import '../domain/models/photo_entity.dart';


import 'dowload_image_to_cload.dart';

class PhotoRepository implements IPhotoRepository {

  @override
  Future<List<PhotoEntity>> getPhotos() async {
    final photos = await downloadImageFromYandexCloud();
    return photos;
  }

}

