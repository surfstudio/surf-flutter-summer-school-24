import 'package:flutter/material.dart';

class ScrollImage extends StatefulWidget {
  const ScrollImage({super.key});

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  int activePage = 0;
  late PageController _pageController;
  List<String> images = [
    'https://i.pinimg.com/564x/40/e3/ed/40e3ed304ab2f8633aec33dc0460239c.jpg',
    'https://i.pinimg.com/236x/eb/61/9f/eb619f95f9f1bf1bfe25ccb97d1587ef.jpg',
    'https://i.pinimg.com/474x/fa/8a/ed/fa8aedb090206ac998db1118f52e72ab.jpg',
    'https://i.pinimg.com/236x/8b/7f/86/8b7f8661933f777677fa1fa9c6138624.jpg',
    'https://i.pinimg.com/236x/f9/6b/73/f96b735c8e0e1c8dfd0729120fc9bca9.jpg',
    'https://i.pinimg.com/236x/d7/eb/b3/d7ebb3254756d4f83b6282c7c3868fdb.jpg'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 600,
            child: PageView.builder(
              itemCount:  images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() => activePage = page);
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              },
            ),
          ),
        )
      ],
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 6 : 25;

    return AnimatedContainer(
      duration: const Duration(microseconds: 800),
      curve: Curves.easeInCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: NetworkImage(
            images[pagePosition],
          ),
          fit: BoxFit.cover,
        )
      ),
    );
  }

  imageAnimation(PageController animation, images, pagePosition) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        print(pagePosition);
        return SizedBox(
          width: 312,
          height: 600,
          child: widget,
        );
      },
      child: Container (
        margin: const EdgeInsets.all(10),
        child: Image.network(images[pagePosition]),
      ),
    );
  }
}