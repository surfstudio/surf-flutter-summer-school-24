import 'package:flutter/material.dart';

class HeadBoard extends StatelessWidget implements PreferredSizeWidget {
  final String _title;
  final int _photoListSize;
  final ValueNotifier<int> currentPhotoIndexNotifier;

  const HeadBoard(
      {super.key,
      required String title,
      required this.currentPhotoIndexNotifier,
      required int photoListSize})
      : _photoListSize = photoListSize,
        _title = title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      title: Text(_title),
      centerTitle: true,
      actions: [
        ValueListenableBuilder<int>(
            valueListenable: currentPhotoIndexNotifier,
            builder: (context, value, child) {
              return Text('$value/$_photoListSize');
            })
      ],
    );
  }
}
