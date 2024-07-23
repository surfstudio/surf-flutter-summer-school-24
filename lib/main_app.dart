import 'package:flutter/material.dart';
import 'screens/photo_gallery_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhotoGalleryScreen(),
    );
  }
}
