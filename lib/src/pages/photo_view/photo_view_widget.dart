import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/pages/photo_view/photo_view_widget_model.dart';

import '../../feature/photos/domain/models/photo_entity.dart';
import 'widgets/photo_view_appbar.dart';
import 'widgets/photo_view_container.dart';

class PhotoViewWidget extends ElementaryWidget<PhotoViewWidgetModel> {
  final List<PhotoEntity> images;
  final int initialIndex;

  const PhotoViewWidget({
    Key? key,
    required this.images,
    required this.initialIndex,
    WidgetModelFactory<PhotoViewWidgetModel> wm = createPhotoViewWidgetModel
    })
      : super(wm, key: key);

  @override
  Widget build(PhotoViewWidgetModel wm) {
    final total = images.length;
    return Scaffold(
      appBar: PhotoViewAppbar(
          total: total,
          currentPageIndex: wm.model.currentPageIndexValueNotifier
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: wm.model.pageController,
                onPageChanged: (index) => wm.model.handlePageViewChanged(index),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return PhotoViewContainer(urlImage: images[index].url);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}