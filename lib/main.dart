import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/data/theme_repository.dart';
import 'package:surf_flutter_summer_school_24/feature/theme/domain/theme_controller.dart';
import 'package:surf_flutter_summer_school_24/app/my_app.dart';
import 'package:surf_flutter_summer_school_24/storage/photos/get_photo_http.dart';
import 'package:surf_flutter_summer_school_24/storage/theme/theme_storage.dart';


// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:surf_flutter_summer_school_24/storage/photos/json_photo_serializable.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final apiClient = ApiClient();
  apiClient.getPhotosUsingHttp();
  // getPhotosUsingHttp();

  final themStorage = ThemeStorage(prefs: prefs);
  final themeRepository = ThemeRepository(themStorage: themStorage);
  final themeController = ThemeController(themeRepository: themeRepository);
  runApp(MainApp(themeController: themeController));
}


// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:surf_flutter_summer_school_24/storage/photos/json_photo_serializable.dart';

// // class ApiClient {
// final String unsplashApi = 'cloud-api.yandex.net';

// Future<List<ResponseList>> getPhotosUsingHttp() async {
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
// final info = photoResponse.map((e) => ResponseList.fromJson(e as Map<String, dynamic>)).toList();

// // print('Responce Status: ${photoResponse.statusCode}');
// // print('Responce Body: ${photoResponse.body}');

// print(info); // ! Эта строчка вызывает ошибку

// return info;
// }
// // }






// class ApiClient {
// final String unsplashApi = 'cloud-api.yandex.net';

// Future<List<ResponseList>> getPhotosUsingHttp() async {
// // getPhotosUsingHttp() async {
//   final photosUri = Uri.https(
//     unsplashApi,
//     'v1/disk/resources/files',
//     {
//       // параметры. пусто, тк обязательных в api нет
//       'path': '/surf_summer_school_24',
//     },
//   );

//   final token = 'y0_AgAAAAAFKq9bAADLWwAAAAELdB6CAAAob_OxaPJGNrQTvjB5ynPurwtg1Q';

// var bigResponse  = await http.get(
//   photosUri, 
//   headers: {
//       HttpHeaders.authorizationHeader: 'OAuth $token',
//     },
//   ) ;
// if (bigResponse.statusCode == 200) {

//   print('Response Status: ${bigResponse.statusCode}');
//   print('Response Body: ${bigResponse.body}');

//     final responsedBody = jsonDecode(bigResponse.body) as Map<String, dynamic>;
    
//     final responsedBodyFromJson = ResponseList.fromJson(responsedBody) ;
// }
//     throw Exception();
// }

// //       for (var element in responsedBodyFromJson.items) {
// //       // print('Resource ID: ${element.resource_id}');
// //       // print('Public URL: ${photo.public_url}');
// //       print('Path: ${element.path}');
// //       // print('Date Time: ${element.date_time}');
// //       print('Items: ${element.items}'); 
// //     } 
// // }
// // }

//     // final info = responsedBody.items.map((e) => ResponseList.fromJson(e  as Map<String, dynamic>)).toList();

//     // print('info: ${info}');

//   //   final bigResponse = responseList.items.map((e) => ResponseElements.fromJson(e as Map<String, dynamic>)).toList();


//   //   for (var element in bigResponse) {
//   //     // print('Resource ID: ${element.resource_id}');
//   //     // print('Public URL: ${photo.public_url}');
//   //     print('Path: ${element.path}');
//   //     // print('Date Time: ${element.date_time}');
//   //     print('Items: ${element.items}'); 
//   //   }
//   // } else {
//   //   // print('Response Status: ${photoResponse.statusCode}');
//   //   // print('Response Body: ${photoResponse.body}');
//   //   print('апокалипсис');
//   // }

//     // final posts = responseList.items.map((e) => ResponseElements.fromJson(e as Map<String, dynamic>)).toList();

//     // if (posts.isEmpty) {
//     //   final Future<List<ResponseElements>> mock = [['items':'dynamic']];
//     //   return mock;
//     // } else {
//     //   return posts;


//     // }


//   // Обработка ошибок
//   //   for (var element in responseList.items) {
//   //     print('Resource ID: ${element.resource_id}');
//   //     // print('Public URL: ${photo.public_url}');
//   //     print('Path: ${element.path}');
//   //     print('Date Time: ${element.date_time}');
//   //     print('Items: ${element.items}'); 
//   //   }
//   // } else {
//   //   // print('Response Status: ${photoResponse.statusCode}');
//   //   // print('Response Body: ${photoResponse.body}');
//   //   print('апокалипсис');
//   // }
// }
// // }
// // }


// // сделать PhotoRespince.fromJson(photoResponse.body)


