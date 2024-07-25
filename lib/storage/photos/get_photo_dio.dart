// ! ?

// import 'package:dio/dio.dart';

// final dio = Dio();

// Future<void> getPhotoUsingDio() async {
//   try {
//     final photoResponseJson = await dio.get(
//       'https://$unsplashApi/photos/$photoId', 
//       queryParameters: {
        
//       }
//     ),
//     print();
//   } on Exeption catch (e) {     // ?
//     if (e is DioException) {
//       if (e.response?.statusCode == 404) {
//         print('Not found');
//       }
//       if (e.response.statusCode == 500) {
//         print('Server Internal Error');
//       }
//     }
//   }
// }



// // Future<void> getPhotoUsingDio() async {
// //   final photoResponseJson = await dio.get('https://dart.dev');
// //     print(photoResponseJson);
// //   } 