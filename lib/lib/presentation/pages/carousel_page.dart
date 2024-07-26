import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:io';
import 'package:photo_view/photo_view.dart';

class CarouselPage extends StatefulWidget {
  final int initialIndex;
  final List<String> photos;

  const CarouselPage({super.key, required this.initialIndex, required this.photos});

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  late int _currentImageIndex;
  bool _isZoomed = false;

  @override
  void initState() {
    super.initState();
    _currentImageIndex = widget.initialIndex;
  }

  void _toggleZoom() {
    setState(() {
      _isZoomed = !_isZoomed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Фото ${_currentImageIndex + 1}/${widget.photos.length}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            aspectRatio: 9 / 16,
            enableInfiniteScroll: false,
            viewportFraction: 0.8,
            initialPage: widget.initialIndex,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
                _isZoomed = false;
              });
            },
          ),
          itemCount: widget.photos.length,
          itemBuilder: (context, index, realIdx) {
            final photo = widget.photos[index];
            return GestureDetector(
              onTap: _toggleZoom,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                child: _isZoomed
                    ? Container(
                        key: ValueKey('zoomed_$index'),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Hero(
                          tag: 'photo_$index',
                          child: PhotoView(
                            imageProvider: photo.startsWith('/assets/images/')
                                ? FileImage(File(photo))
                                : AssetImage(photo) as ImageProvider,
                            minScale: PhotoViewComputedScale.contained * 1.0,
                            maxScale: PhotoViewComputedScale.covered * 4.0,
                          ),
                        ),
                      )
                    : AnimatedContainer(
                        key: ValueKey('normal_$index'),
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 100,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Hero(
                          tag: 'photo_$index',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: photo.startsWith('/assets/images/')
                                ? Image.file(File(photo), fit: BoxFit.cover, width: 1000)
                                : Image.asset(photo, fit: BoxFit.cover, width: 1000),
                          ),
                        ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
