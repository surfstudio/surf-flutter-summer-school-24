import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}



final controller = PageController(
  viewportFraction: 0.7,
  initialPage: 1,
);




List<AssetImage> images = [
  const AssetImage('assets/images/1.jpg'),
  const AssetImage('assets/images/2.jpg'),
  const AssetImage('assets/images/3.jpg'),
];



class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // PageController controller; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!?
  int _currentIndex = 0;


    // @override
    // setState(() {
    // _currentTabIndex = index;
    // });


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
  // 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(child: Text('ну типа 01.01.2021')),
                // SizedBox(width: 50),
                // Text('текущая фотография/всего фотографий')
                Text('${_currentIndex + 1}/${images.length}')
              ]
              ),
          ),
        ),
        body: PageView.builder(
          pageSnapping: false,
          controller: controller,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 600,
                // width: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: images[index], fit: BoxFit.cover),
                ),
                ),
              );
          },
          
        )
        )
      );
    
  }
}

// gridview



// class MainPhoto extends StatefulWidget {
//   const MainPhoto({super.key});


//   @override
//   State<MainPhoto> createState() => _MainPhotoState();

// }

// class _MainPhotoState extends State<MainPhoto> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//             child: Container(
//               height: 800,
//               // width: 400,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(image: images[0], fit: BoxFit.cover),
//               ),
//               ),
//             );
//   }
// }



// class FirstBackPhoto extends StatefulWidget {
//   const FirstBackPhoto({super.key});

//   @override
//   State<FirstBackPhoto> createState() => _FirstBackPhotoState();
// }

// class _FirstBackPhotoState extends State<FirstBackPhoto> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//               child: Container(
//               height: 800,
//               // width:parentWidth*0.8,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(image: images[1], fit: BoxFit.cover),
//               ),
//               ),
//             );
//   }
// }



// class SecondBackPhoto extends StatefulWidget {
//   const SecondBackPhoto({super.key});

//   @override
//   State<SecondBackPhoto> createState() => _SecondBackPhotoState();
// }

// class _SecondBackPhotoState extends State<SecondBackPhoto> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//             child: Container(
//               height: 800,
//               // width:parentWidth*0.8,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(image: images[2], fit: BoxFit.cover),
//               ),
//               ),
//             );
//   }
// }