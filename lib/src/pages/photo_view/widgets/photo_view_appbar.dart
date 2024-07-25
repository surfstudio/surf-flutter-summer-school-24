import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../gallery/gallery_widget.dart';

class PhotoViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int total;
  final ValueNotifier<int> currentPageIndex;
  const PhotoViewAppbar({super.key, required this.total, required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: currentPageIndex,
      builder: (context, currentValue, child) {
        return AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GalleryWidget(),
                  ), (Route<dynamic> route) => false,
                );
              },
              icon: const Icon(Icons.arrow_back_rounded)
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(
                children: [
                  Text((currentPageIndex.value + 1).toString()),
                  Text("/$total", style: TextStyle(color: Theme.of(context).colorScheme.secondary))
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
