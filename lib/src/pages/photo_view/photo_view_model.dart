import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../feature/photos/domain/models/photo_entity.dart';

class PhotoViewModel extends ElementaryModel {
  final ValueNotifier<int> _currentPageIndex;
  final PageController _pageController;
  final List<PhotoEntity> images;

  int get currentPageIndex => _currentPageIndex.value;
  ValueNotifier<int> get currentPageIndexValueNotifier => _currentPageIndex;
  PageController get pageController => _pageController;

  PhotoViewModel(this.images, int initialIndex)
      : _currentPageIndex = ValueNotifier(initialIndex),
        _pageController = PageController(
      initialPage: initialIndex,
      viewportFraction: 0.8

  );

  void handlePageViewChanged(int currentPageIndex) {
    _currentPageIndex.value = currentPageIndex;
  }
}