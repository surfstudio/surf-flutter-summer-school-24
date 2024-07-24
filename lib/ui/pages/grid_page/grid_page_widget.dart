import 'package:cached_network_image/cached_network_image.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/carusel_page/carusel_page_widget.dart';
import 'package:surf_flutter_summer_school_24/ui/pages/grid_page/grid_page_wm.dart';
import 'package:surf_flutter_summer_school_24/ui/ui_kit/widget/custom_app_bar.dart';

class GridPageScreen extends ElementaryWidget<GridPageWM> {
  const GridPageScreen({
    Key? key,
    WidgetModelFactory wmFactory = createGridPageWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(GridPageWM wm) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: wm.images.value.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CarouselPageScreen(),
                    ),
                  );
                },
                child: CachedNetworkImage(
                  imageUrl: wm.images.value[index].url,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.black26,
                    highlightColor: Colors.white24,
                    child: Container(
                      width: 116,
                      height: 116,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
