import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/pages/photo_view/widgets/photo_view_appbar.dart';
import 'package:surf_flutter_summer_school_24/src/pages/photo_view/widgets/photo_view_container.dart';

import '../../models/photo_entity.dart';

class PhotoView extends StatefulWidget {
  final List<PhotoEntity> images;
  final int initialIndex;

  const PhotoView({super.key, required this.images, required this.initialIndex});

  @override
  State<PhotoView> createState() => _PhotoViewState();
}


class _PhotoViewState extends State<PhotoView> with TickerProviderStateMixin {
  late PageController _pageViewController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialIndex;
    _pageViewController = PageController(initialPage: widget.initialIndex, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int total = widget.images.length;
    return Scaffold(
        appBar:  PhotoViewAppbar(total: total, current: _currentPageIndex + 1),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageViewController,
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return PhotoViewContainer(urlImage: widget.images[index].url);
                  },
                ),
              ],
            ),
          ],
        )
    );
  }
}


