import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../feature/photos/data/mock_photo_repository.dart';
import '../photo_view/photo_view.dart';
import 'gallery_model.dart';
import 'gallery_widget.dart';

class GalleryWidgetModel extends WidgetModel<GalleryWidget, GalleryModel> {
  GalleryWidgetModel(GalleryModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.fetchPhotos();
  }

  void onPhotoTap(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PhotoView(
          images: model.images.value, // Получаем значение из ValueNotifier
          initialIndex: index,
        ),
      ),
    );
  }
}