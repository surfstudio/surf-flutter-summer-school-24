import '../../data/models/image_model.dart';

class ImageModel {
  final String dateOfCreate;
  final String imagePath;

  ImageModel({required this.dateOfCreate, required this.imagePath});

  static final List<ImageModel> _images = imgList;

  static List<ImageModel> getAllImages() {
    return _images;
  }

  static void addImage(ImageModel image) {
    _images.add(image);
  }
}
