import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/pages/gallery.dart';

class PhotoViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int total;
  final int current;
  const PhotoViewAppbar({super.key, required this.total, required this.current});

  @override
  Widget build(BuildContext context) {
    String ct = current.toString() + "/" + total.toString();
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Gallery(),
              ), (Route<dynamic> route) => false,
            );
          },
          icon: const Icon(Icons.arrow_back_rounded)
      ),
      actions: [
        Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: Text(ct),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
