import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/ui/ui_kit/typography/typograhy.dart';

class CaruselPage extends StatefulWidget {
  final List<String> images;
  const CaruselPage({super.key, required this.images});

  @override
  _CaruselPageState createState() => _CaruselPageState();
}

class _CaruselPageState extends State<CaruselPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Text(
                '${_currentIndex + 1}',
                style: AppTypography.bold18,
              ),
              Text(
                '/${widget.images.length}',
                style: AppTypography.bold18
                    .copyWith(color: const Color(0xFFBFBFBF)),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: widget.images.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          if (_currentIndex > index) {
            return Container(
              height: 400,
              margin: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(widget.images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(),
              ),
            );
          }
          if (_currentIndex == index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(widget.images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
          if (_currentIndex < index) {
            return Container(
              height: 400,
              margin: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(widget.images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(),
              ),
            );
          }
        },
      ),
    );
  }
}
