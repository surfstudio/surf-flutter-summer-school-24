import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/pages/photo_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/view_photo',
      routes: {
        '/view_photo': (context) => PhotoView(),
      },
    );
  }
}

