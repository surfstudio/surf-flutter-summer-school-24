import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../feature/photos/data/photo_repository.dart';
import '../photo_view/photo_view_widget.dart';
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
        builder: (context) => PhotoViewWidget(
          images: model.images.value,
          initialIndex: index,
        ),
      ),
    );
  }
}

GalleryWidgetModel createGalleryWidgetModel(BuildContext _) =>
GalleryWidgetModel(GalleryModel(PhotoRepository()));