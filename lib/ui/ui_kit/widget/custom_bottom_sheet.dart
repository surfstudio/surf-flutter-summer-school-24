import 'package:flutter/material.dart';
import 'package:surf_flutter_summer_school_24/theme%20/app_color.dart';
import 'package:surf_flutter_summer_school_24/theme%20/di/theme_inherited.dart';
import 'package:surf_flutter_summer_school_24/ui/ui_kit/typography/typograhy.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 161,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  ThemeInherited.of(context).switchThemeMode();
                },
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.sunny,
                        color: AppColor.gray88,
                      ),
                    ),
                    Text(
                      'Тема',
                      style: AppTypography.normal18,
                    )
                  ],
                ),
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.drive_folder_upload_outlined,
                      color: AppColor.gray88,
                    ),
                  ),
                  Text(
                    'Загрузить фото...',
                    style: AppTypography.normal18,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
