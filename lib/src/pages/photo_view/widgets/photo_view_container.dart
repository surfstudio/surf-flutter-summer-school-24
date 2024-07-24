import 'package:flutter/material.dart';

class PhotoViewContainer extends StatelessWidget {
  final String urlImage;

  const PhotoViewContainer({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(23),
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}

