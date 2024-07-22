import 'package:flutter/material.dart';

class PhotoViewAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int total;
  final int current;
  const PhotoViewAppbar({super.key, required this.total, required this.current});

  @override
  Widget build(BuildContext context) {
    String ct = current.toString() + "/" + total.toString();
    return AppBar(
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_rounded)
      ),
      actions: [
        Text(ct)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
