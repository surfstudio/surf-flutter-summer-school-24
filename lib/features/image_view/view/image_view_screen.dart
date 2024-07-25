import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/image_view/widgets/scroll_Image.dart';

@RoutePage()
class ImageViewScreen extends StatefulWidget {
  const ImageViewScreen({super.key});

  @override
  State<ImageViewScreen> createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  //final GlobalKey<ScrollImage> _scrollImageKey = GlobalKey<ScrollImage>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 50,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              '21.05.2023',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300),
            ),
            actions: [imageViewAction('1', '13')],
          ),
          const SliverToBoxAdapter(
            child: ScrollImage(),
          )
        ],
      ),
    );
  }

  Row imageViewAction(String imageIndex, String allImages) {
    return Row(
      children: [
        Text(
          '${imageIndex}',
          style: const TextStyle(
              fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.w300),
        ),
        Text(
          '/${allImages}',
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(width: 22)
      ],
    );
  }
}
