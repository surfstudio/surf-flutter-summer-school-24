import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:surf_flutter_summer_school_24/data/repositories/image_repository.dart';
import 'package:surf_flutter_summer_school_24/domain/models/advanced_image.dart';
import 'package:surf_flutter_summer_school_24/utils/utils.dart';
import 'package:http/http.dart' as http;

class RemoteImageRepository implements ImageRepository {
  static const int batchLimit = 500;
  List<AdvancedImage> _images = [];
  bool _isFetching = false;
  final StreamController<List<AdvancedImage>> _streamController = StreamController<List<AdvancedImage>>.broadcast();

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
          'fields': 'items(name,sizes(url,name))',
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

          print('Batch fetched: ${items.length} items');

          if (items.isEmpty) {
            print('No more items to fetch');
            hasMore = false;
          } else {
            final processedImages = await _processItems(items);
            _images.addAll(processedImages);

            _streamController.add(List.from(_images));
            offset += batchLimit;
          }
        } else {
          print('Failed to get files. Status code: ${response.statusCode}');
          hasMore = false;
        }
      } catch (e) {
        print('Error fetching images: $e');
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

        for (var size in sizes) {
          final name = size['name'] as String;
          if (name == 'XL') {
            final url = size['url'] as String;
            final image = await _loadImage(url);
            if (image != null) {
              images.add(image);
            }
          }
        }
      }
    }

    return images;
  }

  Future<AdvancedImage?> _loadImage(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          HttpHeaders.authorizationHeader: 'OAuth ${Utils.oAuthToken}',
        },
      );

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        return AdvancedImage(image: Image.memory(bytes), id: "rnd");
      } else {
        print('Failed to load image from $url. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Failed to load image from $url: $e');
      return null;
    }
  }
}
