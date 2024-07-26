import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'yandex_disk_utils.dart';

class ImageCarouselPage extends StatefulWidget {
  final List<String> imageUrls;
  final int initialIndex;

  ImageCarouselPage({required this.imageUrls, required this.initialIndex});

  @override
  _ImageCarouselPageState createState() => _ImageCarouselPageState();
}

class _ImageCarouselPageState extends State<ImageCarouselPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.topCenter,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '21.05.2023',
                ),
              ),
            ),
            Text(
              '${_currentIndex + 1}/${widget.imageUrls.length}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: CarouselSlider.builder(
        itemCount: widget.imageUrls.length,
        itemBuilder: (context, index, realIndex) {
          final imageName = widget.imageUrls[index];
          return ShaderMask(
            blendMode: BlendMode.srcOver,
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  index == _currentIndex ? Colors.transparent : Colors.black12,
                  Colors.transparent,
                ],
                stops: [0.5, 0.5001],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: FutureBuilder<File>(
                  future: loadImageFromYandexDisk(imageName),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error loading image'));
                    } else if (snapshot.hasData) {
                      return Image.file(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      );
                    } else {
                      return Center(child: Text('No image'));
                    }
                  },
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 800.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: widget.initialIndex,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
