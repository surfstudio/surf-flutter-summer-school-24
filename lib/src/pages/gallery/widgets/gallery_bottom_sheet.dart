import 'package:flutter/material.dart';
import '../../../feature/theme/di/theme_inherited.dart';

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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
