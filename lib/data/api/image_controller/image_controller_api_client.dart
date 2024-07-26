import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:retrofit/http.dart';

import '../../../domain/domain.dart';

part 'image_controller_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ImageControllerApiClient {
  factory ImageControllerApiClient(Dio dio, {String baseUrl}) =
      _ImageControllerApiClient;

  factory ImageControllerApiClient.create({String? apiUrl}) {
    final dio = Dio(
      BaseOptions(
        headers: {
          HttpHeaders.authorizationHeader: dotenv.env['TOKEN']
        }
      )
    );
    //dio.interceptors.add(TokenInterceptor(storage: const FlutterSecureStorage()));
    if (apiUrl != null) {
      return ImageControllerApiClient(dio, baseUrl: apiUrl);
    }
    return ImageControllerApiClient(dio);
  }

  @GET('v1/disk/resources/upload')
  Future<ImageModel> getUploadFile(
    @Query('path') String path
  );

  @GET('v1/disk/resources/files')
  Future<ItemsModel> getItems();

  @POST('v1/disk/resources/upload')
  @MultiPart()
  Future<void> uploadImage(@Part(name: 'file') File image);
}
