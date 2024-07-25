import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../domain/models/photo_entity.dart';

Future<List<PhotoEntity>> downloadImageFromYandexCloud() async {
  const token = 'y0_AgAAAABZVuavAADLWwAAAAELdHsRAAAWFyiqDOJE_LPjdaheqhXn63NSWA';

  final uri = Uri.https(
    'cloud-api.yandex.net',
    'v1/disk/resources',
    {
      "path": '/',
    },
  );

  final response = await http.get(
    uri,
    headers: {
      HttpHeaders.authorizationHeader: 'OAuth $token',
    },
  );

  if (response.statusCode == 200) {
    final body = response.body;
    final json = jsonDecode(body) as Map<String, dynamic>;
    final items = json['_embedded']['items'] as List<dynamic>;

    return items.where((item) {
      final url = item['file'] as String?;
      return url != null && url.isNotEmpty;
    }).map((item) {
      final id = item['name'] as String;
      final url = item['file'] as String;
      final createAt = DateTime.tryParse(item['created']) ?? null;
      return PhotoEntity(
        id: id,
        url: url,
        createAt: createAt,
      );
    }).toList();
  } else {
    throw Exception('Ошибка получения фотографий с Яндекс.Диска');
  }
}