import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/src/pages/photo_view.dart';
import 'package:surf_flutter_summer_school_24/src/widgets/gallery_appbar.dart';
import 'package:surf_flutter_summer_school_24/src/widgets/photo_gallery_container.dart';

List<String> images = [
  'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album',
  'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album',
  'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album',
  'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album',
  'https://sun9-55.userapi.com/impg/mDIc6RPZmIznA9Uip0tKXeep7gQg5ot0XUUaVw/OyDLqBzPL0A.jpg?size=1024x1280&quality=96&sign=a38727bf7d11a4b1811446972e048f9e&type=album',
  'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album',
  'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album',
  'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album',
  'https://sun9-38.userapi.com/impg/mtqQmWCnxwMDRjqVGEiczyfZ0CqSu7G7e1BpMg/JOfRS5xYG_w.jpg?size=884x884&quality=96&sign=d972f22e5d4b8d82c82323b81655e86e&type=album',
  'https://sun9-25.userapi.com/impg/U1xodQh60uHV1H75doPQtI9lHR-ps4y7pQ7KTQ/vsRSDAx2Ma8.jpg?size=639x641&quality=96&sign=975c4c8ee9bd5e4c3976f211ef239c98&type=album',
  'https://sun9-24.userapi.com/impg/UVP9-Kst1oeGJvfFz6cOgCFRgMacoQrqYeqdZA/s4SRxgafGxk.jpg?size=637x634&quality=96&sign=80155bf77dc4385ccf467379490b1da4&type=album',
  'https://sun9-30.userapi.com/impg/MO4GiY_8B_f3ep-8NusBQWAZOy-QJVTHWyZ2Cw/EJRz0qfPmJE.jpg?size=564x564&quality=96&sign=ef87156b2be6159ab306e12152df3d29&type=album',
  'https://sun9-40.userapi.com/impf/c846017/v846017039/c4d2a/_QCZsc09OYE.jpg?size=540x530&quality=96&sign=733f462520a192a9bbf5b716f00c2a2f&type=album',
  'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album',
  'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album',
  'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album',
  'https://sun9-55.userapi.com/impg/mDIc6RPZmIznA9Uip0tKXeep7gQg5ot0XUUaVw/OyDLqBzPL0A.jpg?size=1024x1280&quality=96&sign=a38727bf7d11a4b1811446972e048f9e&type=album',
  'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album',
  'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album',
  'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album',
  'https://sun9-38.userapi.com/impg/mtqQmWCnxwMDRjqVGEiczyfZ0CqSu7G7e1BpMg/JOfRS5xYG_w.jpg?size=884x884&quality=96&sign=d972f22e5d4b8d82c82323b81655e86e&type=album',
  'https://sun9-25.userapi.com/impg/U1xodQh60uHV1H75doPQtI9lHR-ps4y7pQ7KTQ/vsRSDAx2Ma8.jpg?size=639x641&quality=96&sign=975c4c8ee9bd5e4c3976f211ef239c98&type=album',
  'https://sun9-24.userapi.com/impg/UVP9-Kst1oeGJvfFz6cOgCFRgMacoQrqYeqdZA/s4SRxgafGxk.jpg?size=637x634&quality=96&sign=80155bf77dc4385ccf467379490b1da4&type=album',
  'https://sun9-30.userapi.com/impg/MO4GiY_8B_f3ep-8NusBQWAZOy-QJVTHWyZ2Cw/EJRz0qfPmJE.jpg?size=564x564&quality=96&sign=ef87156b2be6159ab306e12152df3d29&type=album',
  'https://sun9-40.userapi.com/impf/c846017/v846017039/c4d2a/_QCZsc09OYE.jpg?size=540x530&quality=96&sign=733f462520a192a9bbf5b716f00c2a2f&type=album',
];

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GalleryAppbar(),
        body: GridView.builder(
          primary: false,
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 3,
            mainAxisSpacing: 5,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoView(images: images, initialIndex: index),
                  ),
                );
              },
              child: FutureBuilder(
                future: loadImage(images[index]),
                builder: (context, snapshot) {
                  if ((snapshot.connectionState == ConnectionState.waiting)) {
                    return PhotoGalleryContainer(
                      urlImage: images[index],
                      isLoading: true,
                    );
                  } else {
                    return PhotoGalleryContainer(
                      urlImage: images[index],
                      isLoading: false,
                    );
                  }
                },
              ),
            );
          },
        ));
  }

  Future<void> loadImage(String urlImage) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }
}
