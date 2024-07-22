import 'package:flutter/material.dart';

class PhotoCarousel extends StatefulWidget {
  const PhotoCarousel({super.key});

  @override
  State<PhotoCarousel> createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  int currentImageCounter = 0;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.5);

  List<String> images = [
    'https://avatars.mds.yandex.net/i?id=8cc3e411ef0d52e04ce4a296566551fc1c20fd4b-5678013-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=6260c9eb807b8ecd8166aed1e396d0b3f45d1425-9618143-images-thumbs&n=13',
    'https://searchthisweb.com/wallpaper/moraine-lake_3840x2400_zzss6.jpg',
    'https://avatars.mds.yandex.net/i?id=9c93c44780b4561596aa745f05cd2ef89113290a-6966404-images-thumbs&n=13',
    'https://avatars.mds.yandex.net/i?id=6e6d4f263c1c3e61553f3f6fb993369d9e60246ff66eb9e6-12434137-images-thumbs&n=13'
  ];

  int allImageCounter = 5;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              leading: BackButton(),
              title: const Center(
                child: Text("21.05.2023"),
              ),
              actions: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                    child: Text("${currentImageCounter + 1}/$allImageCounter",
                        style: TextStyle(fontSize: 18)))
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: PageView.builder(
                      itemCount: images.length,
                      pageSnapping: true,
                      controller: _pageController,
                      onPageChanged: (page) {
                        setState(() => currentImageCounter = page);
                      },
                      itemBuilder: (context, pagePosition) {
                        bool active = pagePosition == currentImageCounter;
                        return slider(images, pagePosition, active);
                      }),

              ),
            )));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 1 : 80;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      image: DecorationImage(
        image: NetworkImage(
          images[pagePosition],
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
