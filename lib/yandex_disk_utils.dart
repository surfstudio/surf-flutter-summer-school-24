import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

const String yandexDiskToken = 'y0_AgAAAABU26XlAADLWwAAAAELkegoAADFSOxB5hJMh7Hn9Vs-fUsZRAMWUg';

Future<void> uploadImageToYandexCloud(String imagePath) async {
  final name = imagePath.split('/').last;

  final uri = Uri.https(
    'cloud-api.yandex.net',
    'v1/disk/resources/upload',
    {
      "path": name,
    },
  );

  final response = await http.get(
    uri,
    headers: {
      HttpHeaders.authorizationHeader: 'OAuth $yandexDiskToken',
    },
  );

  final body = response.body;
  final json = jsonDecode(body);
  json as Map<String, dynamic>;
  final linkToUpload = json['href'] as String;


  final dio = Dio();
  final file = File(imagePath);
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(file.path),
  });
  await dio.put(linkToUpload, data: formData);
}

Future<void> deleteImageFromYandexCloud(String imageName) async {
  final uri = Uri.https(
    'cloud-api.yandex.net',
    'v1/disk/resources',
    {
      "path": imageName,
    },
  );

  final response = await http.delete(
    uri,
    headers: {
      HttpHeaders.authorizationHeader: 'OAuth $yandexDiskToken',
    },
  );

  if (response.statusCode == 204) {
    print('Image deleted successfully');
  } else {
    print('Failed to delete image: ${response.body}');
  }
}

Future<File> loadImageFromYandexDisk(String imageName) async {
  final uri = Uri.https(
    'cloud-api.yandex.net',
    'v1/disk/resources/download',
    {
      "path": imageName,
    },
  );

  final response = await http.get(
    uri,
    headers: {
      HttpHeaders.authorizationHeader: 'OAuth $yandexDiskToken',
    },
  );

  final body = response.body;
  final json = jsonDecode(body);
  final downloadUrl = json['href'] as String;

  final dio = Dio();
  final responseData = await dio.get<List<int>>(
    downloadUrl,
    options: Options(responseType: ResponseType.bytes),
  );

  final tempDir = await Directory.systemTemp.createTemp();
  final tempFile = File('${tempDir.path}/$imageName');
  await tempFile.writeAsBytes(responseData.data!);

  return tempFile;
}
