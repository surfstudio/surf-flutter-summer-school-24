import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../presentation/pages/error_page.dart';
import '../models/image_model.dart';

class PhotoController with ChangeNotifier {
  List<ImageModel> photos = [];
  bool isLoading = false;
  String? errorMessage;

  PhotoController() {
    _loadInitialPhotos();
  }

  Future<void> _loadInitialPhotos() async {
    photos = ImageModel.getAllImages();
    notifyListeners();
  }

  Future<void> pickImage(BuildContext context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      // Проверяем, существует ли файл, перед тем как пытаться его сохранить
      if (await _fileExists(context, File(image.path))) {
        await saveImageLocally(context, File(image.path));
      }
    } else {
      setError(context, 'Изображение не было выбрано.');
    }
  }

  Future<bool> _fileExists(BuildContext context, File file) async {
    try {
      if (!await file.exists()) {
        throw Exception('Asset not found');
      }
      return true;
    } catch (e) {
      setError(context, 'Ошибка при загрузке изображения: ${e.toString()}');
      return false;
    }
  }

  Future<void> saveImageLocally(BuildContext context, File image) async {
    setLoading(true);
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedImage = await image.copy('assets/images/$fileName');

      final newImage = ImageModel(
        dateOfCreate: DateTime.now().toIso8601String(),
        imagePath: savedImage.path,
      );
      photos.add(newImage);
      ImageModel.addImage(newImage);
      notifyListeners();
    } catch (e) {
      setError(context, 'Ошибка при сохранении изображения: ${e.toString()}');
    }
    setLoading(false);
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setError(BuildContext context, String? message) {
    errorMessage = message;
    notifyListeners();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ErrorPage(
          errorMessage: message ?? 'Произошла ошибка. Попробуйте еще раз.',
        ),
      ),
    );
  }
}
