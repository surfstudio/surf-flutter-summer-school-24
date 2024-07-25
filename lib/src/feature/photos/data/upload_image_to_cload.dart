import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

Future<void> uploadImageToYandexCloud(String imagePath) async {
  const token = 'y0_AgAAAABZVuavAADLWwAAAAELdHsRAAAWFyiqDOJE_LPjdaheqhXn63NSWA';

  final uri = Uri.https(
    'cloud-api.yandex.net',
    'v1/disk/resources/upload',
    {
      "path": imagePath.split('/').last,
    },
  );

  final response = await http.get(
    uri,
    headers: {
      HttpHeaders.authorizationHeader: 'OAuth $token',
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