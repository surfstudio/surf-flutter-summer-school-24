import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/features/image_view/widgets/scroll_Image.dart';

@RoutePage()
class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 50,
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              '21.05.2023',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300),
            ),
            actions: [
              Row(
                children: [
                  Text(
                    '13',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300),
                  ),
                  Text(
                    '/37',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(width: 22)
                ],
              )
            ],
          ),
          SliverToBoxAdapter(
            child: ScrollImage(),
          )
        ],
      ),
    );
  }
}
