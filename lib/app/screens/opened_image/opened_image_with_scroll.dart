import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/app/feature/theme/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/app/feature/theme/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/app/feature/theme/ui/theme_builder.dart';
import 'package:surf_flutter_summer_school_24/app/storage/images/images.dart';
import 'package:surf_flutter_summer_school_24/app/uikit/theme/theme_data.dart';
import 'package:surf_flutter_summer_school_24/app/uikit/styles/font_styles.dart';


class OpenedPhotoWithScroll extends StatelessWidget {
  final ThemeController themeController;
  const OpenedPhotoWithScroll({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return ThemeInherited(
      themeController: themeController, 
      child: ThemeBuilder(builder: (
        _, themeMode
      ){
        return MaterialApp(
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: themeMode,
            home: const Page(),
            
        );
      }));
  }
}


final controller = PageController(
  viewportFraction: 0.7,
  initialPage: 1,
);


class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int newIndex = controller.page?.round() ?? 0;
      if (newIndex != _currentIndex) {
        setState(() {
          _currentIndex = newIndex;
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
                  Center(child: Text('01.01.2021', style: MyCustomStyle.mainTextThin,)),
                  ElevatedButton(
                      onPressed: () {ThemeInherited.of(context).switchThemeMode();}, child: const Text('Тема')),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${_currentIndex + 1}',
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

            var _scale = _currentIndex == index ? 1.0 : 0.87;

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
                  height: 600,
                  // width: 400,
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
}
