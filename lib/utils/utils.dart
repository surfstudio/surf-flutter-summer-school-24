import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Utils {
  static const String oAuthToken =
      "y0_AgAAAAAJWl0DAADLWwAAAAELdA8rAADs8M9MkadMFJUc9JzghEtPyAlpBQ";

  static Future<void> deleteImage(String imagePath) async {
    final uri = Uri.https('cloud-api.yandex.net', 'v1/disk/resources',
        {"path": imagePath, "permanently": "true"});

    final response = await http.delete(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'OAuth $oAuthToken',
      },
    );

    if (response.statusCode == 204) {
      print('Image deleted successfully');
    } else {
      print('Failed to delete image: ${response.body}');
    }
  }

  static Future<void> getImageFromCamera() async {
    final picker = ImagePicker();

    picker.pickImage(source: ImageSource.camera).then((img) {
      String? filepath = img?.path;
      if (filepath == null) {
        return;
      }
      Utils.uploadImage(img!);
    });
  }

  static Future<void> getImageFromGalery() async {
    final picker = ImagePicker();

    picker.pickImage(source: ImageSource.gallery).then((img) {
      String? filepath = img?.path;
      if (filepath == null) {
        return;
      }
      Utils.uploadImage(img!);
    });
  }

  static Future<void> uploadImage(XFile fileToUpload) async {
    String name = fileToUpload.name;
    final uri = Uri.https(
        'cloud-api.yandex.net', 'v1/disk/resources/upload', {"path": name});

    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'OAuth $oAuthToken',
      },
    );

    final body = response.body;
    final json = jsonDecode(body);
    json as Map<String, dynamic>;
    final linkToUpload = json['href'] as String;

    final dio = Dio();
    final file = File(fileToUpload.path);
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
    });
    dio.put(linkToUpload, data: formData);
  }
}
