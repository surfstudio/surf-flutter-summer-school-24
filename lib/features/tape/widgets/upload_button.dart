import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/bloc.dart';

class UploadButton extends StatelessWidget {
  final VoidCallback onClickGallery;
  final VoidCallback onClickCamera;

  const UploadButton({
    super.key, 
    required this.onClickGallery, 
    required this.onClickCamera,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Выберите источник изображения'),
            actions: <Widget>[
              TextButton(
                onPressed: onClickGallery,
                child: const Text('Галерея'),
              ),
              TextButton(
                onPressed: onClickCamera,
                child: const Text('Камера'),
              ),
            ],
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset('./assets/icons/upload.svg'),
                const SizedBox(width: 15),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Загрузить фото...',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}


