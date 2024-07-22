import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/photo_scroll/widgets/photo_number.dart';

class HeadBoard extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HeadBoard({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      title: Text(title),
      centerTitle: true,
      actions: const [PhotoNumber()],
    );
  }
}
