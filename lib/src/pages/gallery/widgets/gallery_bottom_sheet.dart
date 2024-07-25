import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../feature/photos/data/photo_repository.dart';
import '../../../feature/photos/data/upload_image_to_cload.dart';
import '../../../feature/theme/di/theme_inherited.dart';

import 'package:http/http.dart' as http;

class GalleryBottomSheet extends StatelessWidget {
  const GalleryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              child:  Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Icon(
                          ThemeInherited.of(context).themeMode.value == ThemeMode.light
                              ? Icons.wb_sunny_outlined
                              : Icons.brightness_2_outlined,
                        ),
                        const SizedBox(width: 10),
                        const Text('Тема'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Text(
                      ThemeInherited.of(context).themeMode.value == ThemeMode.light
                          ? 'Светлая'
                          : 'Темная', style: TextStyle(color: Theme.of(context).colorScheme.secondary)
                    ),
                  ),
                ],
              ),
              onPressed: () {
                ThemeInherited.of(context).switchThemeMode();
              },
            ),
            ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Icon(Icons.cloud_upload_outlined),
                    SizedBox(width: 10),
                    Text('Загрузить фото...'),
                  ],
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            onPressed: () async {
                              _pickImage(ImageSource.gallery, context);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.photo_library_rounded),
                                SizedBox(width: 10),
                                Text('Галерея'),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              _pickImage(ImageSource.camera, context);
                            },
                            child:const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt_rounded),
                                SizedBox(width: 10),
                                Text('Камера'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _pickImage(ImageSource source, BuildContext context) async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: source);

  if (pickedFile != null) {
    await uploadImageToYandexCloud(pickedFile.path);
  }
}
