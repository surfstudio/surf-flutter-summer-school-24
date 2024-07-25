import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/storage/images/images.dart';
import 'package:surf_flutter_summer_school_24/uikit/styles/font_styles.dart';


class PhotoPage extends StatefulWidget {
  final int index;
  const PhotoPage({super.key, required this.index});

  @override
  State<PhotoPage> createState() => _PageState();
  
}

class _PageState extends State<PhotoPage> {

late PageController controller; 
  int currentIndex = 0; 

  @override
  void initState() {
      controller = PageController(
      viewportFraction: 0.8,
      initialPage: widget.index,
    );
    currentIndex = widget.index;
    super.initState();
    controller.addListener(() {
      int newIndex = controller.page?.round() ?? 0;
      if (newIndex != currentIndex) {
        setState(() {
          currentIndex = newIndex;
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
  final dynamicAppBarColorForTextSpan = Theme.of(context).appBarTheme.foregroundColor;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () { Navigator.of(context).pop(); },
          icon: const Icon(Icons.arrow_back)),
          title: Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(flex: 1),
                  Center(child: Text('01.01.2021', style: MyCustomStyle.mainTextThin,)),
                  const Spacer(flex: 1),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$currentIndex + 1}',
                          style: MyCustomStyle.mainTextBold.copyWith(fontSize: 18, color: dynamicAppBarColorForTextSpan),
                        ),
                        TextSpan(
                          text: '/${images.length}',
                          style: MyCustomStyle.mainTextBoldGrey.copyWith(fontSize: 18, color: Color(0xAAAAAAAA)), 
                        )
                      ]
                    ),
                    )
                ]),
          ),
        ),
        body: PageView.builder(
          pageSnapping: false,
          controller: controller,
          itemCount: images.length,
          itemBuilder: (context, index) {

            var _scale = currentIndex == index ? 1.0 : 0.87;
            double _height = currentIndex == index ? 600 : 390;

            return TweenAnimationBuilder(
              duration: const Duration(microseconds: 350),
              tween: Tween(begin: _scale, end: _scale),
              curve: Curves.ease,
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Center(
                child: Container(
                  // margin: const EdgeInsets.symmetric(horizontal: 5),
                  height: _height,
                  width: 557,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image:
                      DecorationImage(image: images[index], fit: BoxFit.cover),
                  ),
                ),
              ),
            );
          },
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}


