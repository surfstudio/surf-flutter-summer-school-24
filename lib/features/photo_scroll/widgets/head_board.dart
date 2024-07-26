import 'package:flutter/material.dart';

class HeadBoard extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final int elements_amount;
  final ValueNotifier<int> currentPhotoIndexNotifier;

  const HeadBoard({
    super.key,
    required this.title,
    required this.currentPhotoIndexNotifier,
    required this.elements_amount
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      title: Text(title),
      centerTitle: true,
      actions: [
        ValueListenableBuilder<int>(
            valueListenable: currentPhotoIndexNotifier,
            builder: (context, value, child) {
              return Text('$value/$elements_amount');
            })
      ],
    );
  }
}
