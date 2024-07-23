import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageCarouselPage(
        imageUrls: [
          'https://i.pinimg.com/originals/58/c6/c2/58c6c2ca662f71f6e164de46e4f9885d.jpg',
          'https://i.pinimg.com/originals/1a/76/ee/1a76eedb59116d6bde09c32fb6b1a8bd.jpg',
          'https://avatars.mds.yandex.net/i?id=073d3664d83f19c1ca766153c7d4cfaf3963aece-5042632-images-thumbs&n=13',
        ],
      ),
    );
  }
}

class ImageCarouselPage extends StatefulWidget {
  final List<String> imageUrls;

  ImageCarouselPage({required this.imageUrls});

  @override
  _ImageCarouselPageState createState() => _ImageCarouselPageState();
}

class _ImageCarouselPageState extends State<ImageCarouselPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Align(
          alignment: Alignment.topCenter,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {}, // Leave it empty to make it non-functional
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '21.05.2023',
                  style: TextStyle(),
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
          final imageUrl = widget.imageUrls[index];
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
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
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
          initialPage: 0,
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