import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/utils/utils.dart';
import 'image_repository.dart';
import 'package:http/http.dart' as http;

class RemoteImageRepository implements ImageRepository {
  static const int batchLimit = 50;
  List<AdvancedImage> _images = [];
  bool _isFetching = false;
  final StreamController<List<AdvancedImage>> _streamController =
  StreamController<List<AdvancedImage>>.broadcast();

  @override
  Future<List<AdvancedImage>> getImages() async {
    if (_isFetching) {
      return _streamController.stream.first;
    }

    _isFetching = true;
    _fetchImages();
    return _streamController.stream.first;
  }

  Future<void> _fetchImages() async {
    int offset = 0;
    bool hasMore = true;

    while (hasMore) {
      print('Fetching batch: offset=$offset, limit=$batchLimit');

      final uriGetFiles = Uri.https(
        'cloud-api.yandex.net',
        'v1/disk/resources/files',
        {
          'limit': '$batchLimit',
          'offset': '$offset',
          'fields': 'items(name,sizes(url,name),created,path)',
        },
      );

      try {
        final response = await http.get(
          uriGetFiles,
          headers: {
            HttpHeaders.authorizationHeader: 'OAuth ${Utils.oAuthToken}',
          },
        );

        if (response.statusCode == 200) {
          final body = response.body;
          final json = jsonDecode(body) as Map<String, dynamic>;
          final items = json['items'] as List<dynamic>;


          if (items.isEmpty) {
            hasMore = false;
          } else {
            final processedImages = await _processItems(items);
            _images.addAll(processedImages);

            _streamController.add(List.from(_images));
            offset += batchLimit;
          }
        } else {
          hasMore = false;
        }
      } catch (e) {
        hasMore = false;
      }
    }

    _isFetching = false;
  }

  Future<List<AdvancedImage>> _processItems(List<dynamic> items) async {
    final images = <AdvancedImage>[];

    for (var item in items) {
      final file = item['name'] as String;
      final extension = file.split('.').last.toLowerCase();

      if (extension == 'png' || extension == 'jpg') {
        final sizes = item['sizes'] as List<dynamic>;
        final createdAt = DateTime.parse(item['created'] as String);
        final path = item['path'] as String;

        for (var size in sizes) {
          final name = size['name'] as String;
          if (name == 'XL') {
            final url = size['url'] as String;
            final image = await _loadImage(url, createdAt, path);
            if (image != null) {
              images.add(image);
            }
          }
        }
      }
    }

    return images;
  }

  Future<AdvancedImage?> _loadImage(String url, DateTime createdAt, String path) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'OAuth ${Utils.oAuthToken}',
        },
      );

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        return AdvancedImage(
          image: Image.memory(
            bytes,
            fit: BoxFit.cover,
          ),
          id: path,
          createdAt: createdAt,
          path: path,
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
