import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class PhotoGalleryContainer extends StatefulWidget {
  final String urlImage;

  const PhotoGalleryContainer({super.key, required this.urlImage});

  @override
  State<PhotoGalleryContainer> createState() => _PhotoGalleryContainerState();
}

class _PhotoGalleryContainerState extends State<PhotoGalleryContainer> {


  @override
  Widget build(BuildContext context) {
    return Image.network(
      widget.urlImage,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.errorContainer,
          highlightColor: Theme.of(context).colorScheme.onErrorContainer,
          period: const Duration(milliseconds: 600),
          direction: ShimmerDirection.ltr,
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            height: double.infinity,
          ),
        );
      },
    );
  }
}
