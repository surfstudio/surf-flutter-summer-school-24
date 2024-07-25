import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/pages/gallery/widgets/gallery_bottom_sheet.dart';

class GalleryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const GalleryAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Постограм";
    return AppBar(
      centerTitle: true,
      title: Text(title),
      actions: [
        IconButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const GalleryBottomSheet();
                }
              );
            },
            icon: const Icon(Icons.more_vert)
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}