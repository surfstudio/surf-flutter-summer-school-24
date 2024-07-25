import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:surf_flutter_summer_school_24/src/pages/photo_view/photo_view_model.dart';
import 'package:surf_flutter_summer_school_24/src/pages/photo_view/photo_view_widget.dart';


class PhotoViewWidgetModel extends WidgetModel<PhotoViewWidget, PhotoViewModel> {
  PhotoViewWidgetModel(PhotoViewModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model.pageController.addListener(() {
      model.handlePageViewChanged(model.pageController.page!.toInt());
    });
  }

}

PhotoViewWidgetModel createPhotoViewWidgetModel(BuildContext context) {
  final images = (context.widget as PhotoViewWidget).images;
  final initialIndex = (context.widget as PhotoViewWidget).initialIndex;
  return PhotoViewWidgetModel(PhotoViewModel(images, initialIndex));
}
