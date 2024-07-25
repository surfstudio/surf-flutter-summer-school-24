// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:surf_flutter_summer_school_24/storage/photos/json_photo_serializable.dart';

// class ApiClient {
// final String unsplashApi = 'cloud-api.yandex.net';

// Future<List<PhotoResponse>> getPhotosUsingHttp() async {
//   final photosUri = Uri.https(
//     unsplashApi,
//     'v1/disk/resources/files',
//     {
//       // параметры. пусто, тк обязательных в api нет
//     },
//   );

//   final token = 'y0_AgAAAAAFKq9bAADLWwAAAAELdB6CAAAob_OxaPJGNrQTvjB5ynPurwtg1Q';

// var photoResponse = await http.get(
//   photosUri, 
//   headers: {
//       HttpHeaders.authorizationHeader: 'OAuth $token',
//     },
//   ) as List<dynamic>;
// // сделать PhotoRespince.fromJson(photoResponse.body)
// final posts = photoResponse.map((e) => PhotoResponse.fromJson(e as Map<String, dynamic>)).toList();

// // print('Responce Status: ${photoResponse.statusCode}');
// // print('Responce Body: ${photoResponse.body}');

// print(posts); // ! Эта строчка вызывает ошибку

// return posts;
// }
// }



import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:surf_flutter_summer_school_24/storage/photos/json_photo_serializable.dart';


class ApiClient {
final String unsplashApi = 'cloud-api.yandex.net';

Future<List<ResponseElements>> getPhotosUsingHttp() async {
  final photosUri = Uri.https(
    unsplashApi,
    'v1/disk/resources/files',
    {
      // параметры. пусто, тк обязательных в api нет
      'path': '/surf_summer_school_24',
    },
  );

  final token = 'some token';

var bigResponse  = await http.get(
  photosUri, 
  headers: {
      HttpHeaders.authorizationHeader: 'OAuth $token',
    },
  );
if (bigResponse.statusCode == 200) {
    final responseJson = jsonDecode(bigResponse.body);
    final responseList = ResponseList.fromJson(responseJson);
    final posts = responseList.items.map((e) => ResponseElements.fromJson(e as Map<String, dynamic>)).toList();
    if (posts.isEmpty) {
      final Future<List<ResponseElements>> mock = [['items':'dynamic']];
      return mock;
    } else {
      return posts;
    }


  // Обработка ошибок
  //   for (var element in responseList.items) {
  //     print('Resource ID: ${element.resource_id}');
  //     // print('Public URL: ${photo.public_url}');
  //     print('Path: ${element.path}');
  //     print('Date Time: ${element.date_time}');
  //     print('Items: ${element.items}'); 
  //   }
  // } else {
  //   // print('Response Status: ${photoResponse.statusCode}');
  //   // print('Response Body: ${photoResponse.body}');
  //   print('апокалипсис');
  // }
}
}
}


// сделать PhotoRespince.fromJson(photoResponse.body)
