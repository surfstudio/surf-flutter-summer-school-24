import 'package:surf_flutter_summer_school_24/data/repositories/image_repository.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/remote_image_repository.dart';
import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';

class AdvancedImageInteractor {
  final ImageRepository _repository = RemoteImageRepository();

  Future<List<AdvancedImage>> getAdvancedImages() async {
    return await _repository.getImages();
  }
}
