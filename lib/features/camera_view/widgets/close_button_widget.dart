import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.close,
        color: Colors.white,
        size: 32,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
