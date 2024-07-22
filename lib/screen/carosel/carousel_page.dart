import 'package:flutter/material.dart';

import 'widgets/carousel_screen_body.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CarouselScreenBody(),
    );
  }
}
