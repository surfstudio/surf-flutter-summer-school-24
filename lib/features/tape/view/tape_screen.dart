import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_summer_school_24/features/tape/widgets/image_box.dart';

@RoutePage()
class TapeScreen extends StatelessWidget {
  const TapeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 50,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Image.asset('./assets/images/logo.png'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('./assets/icons/points.svg'),
              ),
            ],
          ),
          const SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: ImageBox()
            ),
        ],
      ),
    );
  }
}