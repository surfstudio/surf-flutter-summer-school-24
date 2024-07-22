import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/screen/carosel/widgets/carousel_screen_body.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CarouselScreenBody(),
    );
  }
}
