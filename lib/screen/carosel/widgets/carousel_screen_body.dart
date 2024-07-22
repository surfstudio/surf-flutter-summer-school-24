import 'dart:ui';

import 'package:flutter/material.dart';

class CarouselScreenBody extends StatefulWidget {
  const CarouselScreenBody({
    super.key,
  });

  @override
  State<CarouselScreenBody> createState() => _CarouselScreenBodyState();
}

class _CarouselScreenBodyState extends State<CarouselScreenBody> {
  List<String> images = [
    'https://c4.wallpaperflare.com/wallpaper/586/603/742/minimalism-4k-for-mac-desktop-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/448/174/357/neon-4k-hd-best-for-desktop-wallpaper-preview.jpg',
    ''
  ];
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }

  int activePage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 700,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                const Text("22.07.24"),
                Text("${activePage + 1}/${images.length}"),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: Stack(
            children: [
              PageView.builder(
                  itemCount: images.length,
                  pageSnapping: true,
                  controller: _pageController,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, pagePosition) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/images/$pagePosition.jpg',
                      ),
                    );
                  }),
              Positioned(
                width: 50,
                height: 200,
                top: 50,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2, // mess with this to update blur
                        sigmaY: 2),
                    child: Container(),
                  ),
                ),
              ),
              Positioned(
                width: 50,
                height: 200,
                top: 50,
                right: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 2, // mess with this to update blur
                        sigmaY: 2),
                    child: Container(),
                  ),
                ),
              ),
            ],
          ),
        ),
        pips(),
      ],
    );
  }

  Row pips() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators(images.length, activePage, (int index) {
          setState(() {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 250),
              curve: Curves.ease,
            );
          });
        }));
  }
}

List<Widget> indicators(
    imagesLength, currentIndex, void Function(int index) setter) {
  return List<Widget>.generate(imagesLength, (index) {
    return GestureDetector(
      onTap: () {
        setter(index);
      },
      child: Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      ),
    );
  });
}
