import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/data/photo.dart';

class PhotoCard extends StatelessWidget {
  final Photo photo;

  const PhotoCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(photo.path, fit: BoxFit.cover, filterQuality: FilterQuality.none),
      ),
    );
  }
}
