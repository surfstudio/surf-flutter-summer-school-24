// presentation/pages/carousel_page.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data/models/image_model.dart';

class CarouselPage extends StatefulWidget {
  final int initialIndex;
  const CarouselPage({super.key, required this.initialIndex});

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  late int _currentImageIndex;

  @override
  void initState() {
    super.initState();
    _currentImageIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(imgList[_currentImageIndex].dateOfCrete),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 36.0),
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 22,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${_currentImageIndex + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: '/${imgList.length}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 9 / 16,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            initialPage: widget.initialIndex,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: imgList
              .map(
                (item) => Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(item.imagePath, fit: BoxFit.cover, width: 1000),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
