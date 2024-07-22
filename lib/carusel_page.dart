import 'dart:ui';

import 'package:flutter/material.dart';

class CaruselPage extends StatefulWidget {
  const CaruselPage({super.key});

  @override
  _CaruselPageState createState() => _CaruselPageState();
}

class _CaruselPageState extends State<CaruselPage> {
  final List<String> _images = [
    'https://img.freepik.com/free-photo/delicious-street-food-fest_23-2151543468.jpg?w=1380&t=st=1721638800~exp=1721639400~hmac=8ea5b2dd04c52a23b9147c2c9350da432088ba54c5e7e436038f293ba1fe1c42',
    'https://img.freepik.com/free-photo/view-of-wild-elk-in-nature_23-2151017808.jpg?w=996&t=st=1721638817~exp=1721639417~hmac=ec22522cf4a97fbe20c938da310fd29702f466fc53bab45254bab05f00770b51',
    'https://img.freepik.com/free-photo/tiger-looking-with-the-open-mouth_1150-18083.jpg?w=1060&t=st=1721638831~exp=1721639431~hmac=11ea6b3ae7e9ce032f5b826419ba9567ac1902b4cedf2dfe4325f366a5706fb1',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Text(
                '${_currentIndex + 1}',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              Text('/${_images.length}'),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: _images.length,
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
                  image: NetworkImage(_images[index]),
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
                  image: NetworkImage(_images[index]),
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
                  image: NetworkImage(_images[index]),
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
