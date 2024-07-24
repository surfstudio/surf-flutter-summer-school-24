import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/widgets/photo_view_appbar.dart';
import 'package:surf_flutter_summer_school_24/src/widgets/photo_view_container.dart';

class PhotoView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const PhotoView({super.key, required this.images, required this.initialIndex});

  @override
  State<PhotoView> createState() => _PhotoViewState();
}


class _PhotoViewState extends State<PhotoView> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.initialIndex;
    _pageViewController = PageController(initialPage: widget.initialIndex, viewportFraction: 0.8);
    _tabController = TabController(length: widget.images.length, vsync: this, initialIndex: widget.initialIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
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
                  onPageChanged: _handlePageViewChanged,
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return PhotoViewContainer(urlImage: widget.images[index]);
                  },
                ),
              ],
            ),
          ],
        )
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      setState(() {
        _currentPageIndex = currentPageIndex;
      });
    } else {
      _tabController.index = currentPageIndex;
    }
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}


