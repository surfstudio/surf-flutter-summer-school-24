import 'package:surf_flutter_summer_school_24/domain/model/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/data/mock_image_repository.dart';
import 'package:surf_flutter_summer_school_24/data/image_repository.dart';

class AdvancedImageInteractor {
  ImageRepository imageRepository = MockImageRepository();
  List<AdvancedImage>? aImages;

  Future<List<AdvancedImage>?> getAdvancedImages() async {
    imageRepository.getImage().then((advancedImage) {
      return advancedImage;
    });
    return null;
  }
}
