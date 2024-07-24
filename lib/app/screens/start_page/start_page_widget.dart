import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/app/feature/theme/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/app/screens/opened_image/opened_image_with_scroll.dart';
import 'package:surf_flutter_summer_school_24/app/storage/images/images.dart';
import 'package:surf_flutter_summer_school_24/app/uikit/styles/font_styles.dart';

class StartPageWidget extends StatefulWidget {
  const StartPageWidget({super.key});

  @override
  State<StartPageWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPageWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          InversionOfBlackPng(child: Image.asset('assets/images/lologram.png', width: 140)),
          const Spacer(flex: 1)
        ],
      ),
      actions: [
        InversionOfBlackPng(child: IconButton(
          onPressed: (){
            showModalBottomSheet(
              context: context,
                builder: (BuildContext context) {
                  return BottomSheetContent();
                },
            );
            }, 
          icon: Image.asset('assets/images/iconMenu.png')
          ))
      ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoPage(index: index)
                )
              );
            },
            child: Image(image: images[index], fit: BoxFit.cover)
          );
        }
    )
    );
  }
}


class InversionOfBlackPng extends StatelessWidget {
  final Widget child;
  const InversionOfBlackPng({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return ColorFiltered(
      colorFilter: isDarkMode
                      ? const ColorFilter.matrix(<double>[
                          -1,  0,  0,  0, 255, // red
                           0, -1,  0,  0, 255, // green
                           0,  0, -1,  0, 255, // blue
                           0,  0,  0,  1,   0, // alpha
                        ])
                      : const ColorFilter.mode(Colors.transparent, BlendMode.multiply),
      child: child,
      );
  }
}


class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final whatKindOfTheme = Theme.of(context).brightness == Brightness.light;
    final currentTheme;
    if (whatKindOfTheme) {
      currentTheme = 'Светлая';
    } else {
      currentTheme = 'Темная';
    }
    return Container(
      padding: EdgeInsets.all(16.0),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                ThemeInherited.of(context).switchThemeMode();
                }, 
              child: Row(
                children: [
                  const Icon(Icons.wb_sunny_outlined),
                  const SizedBox(width: 10),
                  Text('Тема', style: MyCustomStyle.mainText.copyWith(fontSize: 18),),
                  const Expanded(child: SizedBox()),
                  Text('$currentTheme', style: MyCustomStyle.mainTextThin.copyWith(fontSize: 18),)
                ],
              ),
            ),
              
            ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                
              },
              child: Row(
                children: [
                  const Icon(Icons.cloud_upload),
                  SizedBox(width: 10),
                  Text('Загрузить фото...', style: MyCustomStyle.mainText.copyWith(fontSize: 18),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}