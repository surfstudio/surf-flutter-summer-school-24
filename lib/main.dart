import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

void main() {
  runApp(MaterialApp(
    home: CarouselPage(),
  ));
}

class _CarouselPageState extends State<CarouselPage> {
  int _currentImageIndex = 0;
  //Set для неповторяемости имён
  final Set <String> imgList = {
    'assets/images/Default_madoka_magica_art_0.jpg',
    'assets/images/Default_madoka_magica_art_1.jpg',
    'assets/images/Default_madoka_magica_art_2.jpg',
    'assets/images/Default_madoka_magica_art_3.jpg',
  };
  //Возможно, в Map слепить Set и List. А может и нет...
  final List<String> titleList = [
    '01.03.2023',
    '02.05.2023',
    '03.06.2023',
    '03.01.2024',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titleList[_currentImageIndex]),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {//TODO:Хех, нерабочая кнопка. Починить позже.
            Navigator.pop(context);
          },
        ),
        actions: [
          Container(
            //отступ от правого края
            padding: EdgeInsets.only(right: 16.0),
            child: Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: '${_currentImageIndex}',
                    style: TextStyle(fontWeight: FontWeight.bold),
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
            //Прикольно, но руками веселее
            ///autoPlay: true,
            enlargeCenterPage: true,
            //отношение сторон
            aspectRatio: 9 / 16,
            //Для галереи кажется логичнее конечная промотка
            enableInfiniteScroll: false,
            //видимость следующего фото в отношении
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: imgList.map((item) => Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Скругление углов
              child: Image.asset(item, fit: BoxFit.cover, width: 1000),
            ),
          )).toList(),
        ),
      ),
    );
  }
}