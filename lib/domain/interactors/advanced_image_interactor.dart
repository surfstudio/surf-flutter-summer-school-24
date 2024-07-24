import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/data/repositories/mock_image_repository.dart';

class AdvancedImageInteractor {
  final MockImageRepository _repository = MockImageRepository();

  Future<List<AdvancedImage>> getAdvancedImages() async {
    return await _repository.getImages();
  }
}
