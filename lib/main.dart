import 'package:flutter/material.dart';
import 'photocarousel.dart';

void main() {
  runApp(const PhotoCarousel());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
