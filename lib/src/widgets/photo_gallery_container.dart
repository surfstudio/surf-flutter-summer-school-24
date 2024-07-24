import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/widgets/shimmer_loading.dart';

class PhotoGalleryContainer extends StatelessWidget {
  final String urlImage;
  final bool isLoading;

  const PhotoGalleryContainer({super.key, required this.urlImage, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: isLoading,
      child: Container(
        child: Image.network(urlImage, fit: BoxFit.cover),
      ),
    );
  }
}
