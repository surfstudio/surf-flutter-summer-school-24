import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/widgets/photo_view_appbar.dart';

List<String> images = [
  'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album',
  'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album',
  'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album',
  'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album',
  'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album'
];

class PhotoView extends StatefulWidget {
  const PhotoView({super.key});

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
    _pageViewController = PageController();
    _tabController = TabController(length: images.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int total = images.length;
    return Scaffold(
        appBar:  PhotoViewAppbar(total: total, current: _currentPageIndex + 1),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            // Wrap PageView in a Stack to overlay previous/next image previews
            Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageViewController,
                  onPageChanged: _handlePageViewChanged,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // Add padding here
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(23),
                            child: Image.network(
                              images[_currentPageIndex],
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),

                    );
                  },
                ),
              ],
            ),
            PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              isOnDesktopAndWeb: _isOnDesktopAndWeb,
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

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(
              Icons.arrow_left_rounded,
              size: 32.0,
            ),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 2) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(
              Icons.arrow_right_rounded,
              size: 32.0,
            ),
          ),
        ],
      ),
    );
  }
}

