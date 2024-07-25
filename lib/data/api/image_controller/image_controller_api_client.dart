import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../domain/domain.dart';

part 'image_controller_api_client.g.dart';

@RestApi(baseUrl: '')
abstract class ImageControllerApiClient {
  factory ImageControllerApiClient(Dio dio, {String baseUrl}) =
      _ImageControllerApiClient;

  factory ImageControllerApiClient.create({String? apiUrl}) {
    final dio = Dio();
    if (apiUrl != null) {
      return ImageControllerApiClient(dio, baseUrl: apiUrl);
    }
    return ImageControllerApiClient(dio);
  }

  @GET('')
  Future<List<ImageModel>> getAllImages();

  @POST('')
  @MultiPart()
  Future<void> uploadImage(@Part(name: 'image') File image);
}
