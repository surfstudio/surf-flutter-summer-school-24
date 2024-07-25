// presentation/pages/grid_view_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/controllers/theme_controller.dart';
import '../../data/models/image_model.dart';
import '../../domain/models/custom_theme_mode.dart';
import 'carousel_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Постограмм',
          style: GoogleFonts.caveat(
            textStyle: const TextStyle(
              height: 20,
              fontSize: 30,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 200,
                    child: Column(
                      children: CustomThemeMode.values.map((themeMode) {
                        return ListTile(
                          leading: Icon(
                            themeController.themeMode == themeMode
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                          ),
                          title: Text(_themeModeToString(themeMode)),
                          onTap: () {
                            themeController.setThemeMode(themeMode);
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0,
        ),
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarouselPage(initialIndex: index),
                ),
              );
            },
            child: GridTile(
              child: Image.asset(
                imgList[index].imagePath,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  String _themeModeToString(CustomThemeMode themeMode) {
    switch (themeMode) {
      case CustomThemeMode.light:
        return 'Светлая';
      case CustomThemeMode.dark:
        return 'Темная';
      default:
        return '';
    }
  }
}
