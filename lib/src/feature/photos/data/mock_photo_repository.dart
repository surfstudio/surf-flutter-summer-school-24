import 'package:surf_flutter_summer_school_24/src/feature/photos/data/i_photo_repository.dart';
import 'package:surf_flutter_summer_school_24/src/models/photo_entity.dart';


class MockPhotoRepository implements IPhotoRepository {
  @override
  Future<List<PhotoEntity>> getPhotos() async{
    return [
      const PhotoEntity(
          id: '1',
          url: 'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album'
      ),
      const PhotoEntity(
          id: '2',
          url: 'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album'
      ),
      const PhotoEntity(
          id: '3',
          url: 'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album'
      ),
      const PhotoEntity(
          id: '4',
          url: 'https://sun9-55.userapi.com/impg/mDIc6RPZmIznA9Uip0tKXeep7gQg5ot0XUUaVw/OyDLqBzPL0A.jpg?size=1024x1280&quality=96&sign=a38727bf7d11a4b1811446972e048f9e&type=album'
      ),
      const PhotoEntity(
          id: '5',
          url: 'https://sun9-38.userapi.com/impg/mtqQmWCnxwMDRjqVGEiczyfZ0CqSu7G7e1BpMg/JOfRS5xYG_w.jpg?size=884x884&quality=96&sign=d972f22e5d4b8d82c82323b81655e86e&type=album'
      ),
      const PhotoEntity(
          id: '6',
          url: 'https://sun9-25.userapi.com/impg/U1xodQh60uHV1H75doPQtI9lHR-ps4y7pQ7KTQ/vsRSDAx2Ma8.jpg?size=639x641&quality=96&sign=975c4c8ee9bd5e4c3976f211ef239c98&type=album'
      ),
      const PhotoEntity(
          id: '7',
          url: 'https://sun9-24.userapi.com/impg/UVP9-Kst1oeGJvfFz6cOgCFRgMacoQrqYeqdZA/s4SRxgafGxk.jpg?size=637x634&quality=96&sign=80155bf77dc4385ccf467379490b1da4&type=album'
      ),
      const PhotoEntity(
          id: '8',
          url: 'https://sun9-30.userapi.com/impg/MO4GiY_8B_f3ep-8NusBQWAZOy-QJVTHWyZ2Cw/EJRz0qfPmJE.jpg?size=564x564&quality=96&sign=ef87156b2be6159ab306e12152df3d29&type=album'
      ),
      const PhotoEntity(
          id: '9',
          url: 'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album'
      ),
      const PhotoEntity(
          id: '10',
          url: 'https://sun9-40.userapi.com/impf/c846017/v846017039/c4d2a/_QCZsc09OYE.jpg?size=540x530&quality=96&sign=733f462520a192a9bbf5b716f00c2a2f&type=album'
      ),
      const PhotoEntity(
          id: '11',
          url: 'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album'
      ),
      const PhotoEntity(
          id: '12',
          url: 'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album'
      ),
      const PhotoEntity(
          id: '13',
          url: 'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album'
      ),
      const PhotoEntity(
          id: '14',
          url: 'https://sun9-55.userapi.com/impg/mDIc6RPZmIznA9Uip0tKXeep7gQg5ot0XUUaVw/OyDLqBzPL0A.jpg?size=1024x1280&quality=96&sign=a38727bf7d11a4b1811446972e048f9e&type=album'
      ),
      const PhotoEntity(
          id: '15',
          url: 'https://sun9-38.userapi.com/impg/mtqQmWCnxwMDRjqVGEiczyfZ0CqSu7G7e1BpMg/JOfRS5xYG_w.jpg?size=884x884&quality=96&sign=d972f22e5d4b8d82c82323b81655e86e&type=album'
      ),
      const PhotoEntity(
          id: '16',
          url: 'https://sun9-25.userapi.com/impg/U1xodQh60uHV1H75doPQtI9lHR-ps4y7pQ7KTQ/vsRSDAx2Ma8.jpg?size=639x641&quality=96&sign=975c4c8ee9bd5e4c3976f211ef239c98&type=album'
      ),
      const PhotoEntity(
          id: '17',
          url: 'https://sun9-24.userapi.com/impg/UVP9-Kst1oeGJvfFz6cOgCFRgMacoQrqYeqdZA/s4SRxgafGxk.jpg?size=637x634&quality=96&sign=80155bf77dc4385ccf467379490b1da4&type=album'
      ),
      const PhotoEntity(
          id: '18',
          url: 'https://sun9-30.userapi.com/impg/MO4GiY_8B_f3ep-8NusBQWAZOy-QJVTHWyZ2Cw/EJRz0qfPmJE.jpg?size=564x564&quality=96&sign=ef87156b2be6159ab306e12152df3d29&type=album'
      ),
      const PhotoEntity(
          id: '19',
          url: 'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album'
      ),
      const PhotoEntity(
          id: '20',
          url: 'https://sun9-40.userapi.com/impf/c846017/v846017039/c4d2a/_QCZsc09OYE.jpg?size=540x530&quality=96&sign=733f462520a192a9bbf5b716f00c2a2f&type=album'
      ),const PhotoEntity(
          id: '21',
          url: 'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album'
      ),
      const PhotoEntity(
          id: '22',
          url: 'https://sun9-70.userapi.com/impg/5y5vwIq2-aaxiyscdm9XWy3iOw-KDQUPbWoidg/-J_O_1Pnx9Q.jpg?size=1024x1280&quality=96&sign=285af90845367d97da75d3dbceabbea0&type=album'
      ),
      const PhotoEntity(
          id: '23',
          url: 'https://sun9-66.userapi.com/impg/c855428/v855428659/1df047/63VkypHBeZo.jpg?size=604x377&quality=96&sign=84e35c2c415bcf6603d8c81269bcfec4&type=album'
      ),
      const PhotoEntity(
          id: '24',
          url: 'https://sun9-55.userapi.com/impg/mDIc6RPZmIznA9Uip0tKXeep7gQg5ot0XUUaVw/OyDLqBzPL0A.jpg?size=1024x1280&quality=96&sign=a38727bf7d11a4b1811446972e048f9e&type=album'
      ),
      const PhotoEntity(
          id: '25',
          url: 'https://sun9-38.userapi.com/impg/mtqQmWCnxwMDRjqVGEiczyfZ0CqSu7G7e1BpMg/JOfRS5xYG_w.jpg?size=884x884&quality=96&sign=d972f22e5d4b8d82c82323b81655e86e&type=album'
      ),
      const PhotoEntity(
          id: '26',
          url: 'https://sun9-25.userapi.com/impg/U1xodQh60uHV1H75doPQtI9lHR-ps4y7pQ7KTQ/vsRSDAx2Ma8.jpg?size=639x641&quality=96&sign=975c4c8ee9bd5e4c3976f211ef239c98&type=album'
      ),
      const PhotoEntity(
          id: '27',
          url: 'https://sun9-24.userapi.com/impg/UVP9-Kst1oeGJvfFz6cOgCFRgMacoQrqYeqdZA/s4SRxgafGxk.jpg?size=637x634&quality=96&sign=80155bf77dc4385ccf467379490b1da4&type=album'
      ),
      const PhotoEntity(
          id: '28',
          url: 'https://sun9-30.userapi.com/impg/MO4GiY_8B_f3ep-8NusBQWAZOy-QJVTHWyZ2Cw/EJRz0qfPmJE.jpg?size=564x564&quality=96&sign=ef87156b2be6159ab306e12152df3d29&type=album'
      ),
      const PhotoEntity(
          id: '29',
          url: 'https://sun9-67.userapi.com/impg/tX4OvfRLP0qjy8pX-D7WGIrPp6tU9Kk5OQErBw/O7cfSBKIhps.jpg?size=1199x1199&quality=95&sign=032b69843ac686317904906820bf4020&type=album'
      ),
      const PhotoEntity(
          id: '30',
          url: 'https://sun9-40.userapi.com/impf/c846017/v846017039/c4d2a/_QCZsc09OYE.jpg?size=540x530&quality=96&sign=733f462520a192a9bbf5b716f00c2a2f&type=album'
      ),
    ];
  }
}