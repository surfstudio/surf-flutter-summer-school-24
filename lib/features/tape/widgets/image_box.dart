import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/router/router.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';

class ImageBox extends StatefulWidget {
  const ImageBox({super.key});

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  final IPhotoRepository photoRepository = MockPhotoRepository();
  List<String> images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                context.router.push(const ImageViewRoute());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          childCount: images.length,
        ));
  }

  Future<void> _loadImages() async {
    final photos = await photoRepository.getPhotos();
    setState(() {
      images = photos.map((photo) => photo.url).toList();
    });
  }
}
