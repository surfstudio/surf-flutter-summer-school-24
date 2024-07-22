import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/data/photo.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(photo.path),
    );
  }
}
