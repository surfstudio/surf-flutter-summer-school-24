import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';

class ScrollImage extends StatefulWidget {
  const ScrollImage({super.key});

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  int activePage = 0;
  late PageController _pageController;
  final IPhotoRepository photoRepository = MockPhotoRepository();

  List<String> images = [];
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
    _checkInternetConnection();
    _loadImages();
  }

  Future<void> _checkInternetConnection() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = result != ConnectivityResult.none;
    });
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
            child: isConnected
                ? PageView.builder(
                    itemCount: images.length,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() => activePage = page);
                    },
                    itemBuilder: (context, pagePosition) {
                      bool active = pagePosition == activePage;
                      return slider(images, pagePosition, active);
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        )
      ],
    );
  }

  AnimatedContainer slider(List<String> images, int pagePosition, bool active) {
    double margin = active ? 6 : 25;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            images[pagePosition],
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _loadImages() async {
    final photos = await photoRepository.getPhotos();
    setState(() {
      images = photos.map((photo) => photo.url).toList();
    });
  }
}







