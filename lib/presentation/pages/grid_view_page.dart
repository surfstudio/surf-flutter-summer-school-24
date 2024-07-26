import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/controllers/photo_controller.dart';
import '../../domain/controllers/theme_controller.dart';
import '../../domain/models/custom_theme_mode.dart';
import 'carousel_page.dart';
import 'error_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  int _crossAxisCount = 3;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    Provider.of<PhotoController>(context);

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
                      children: [
                        ...CustomThemeMode.values.map((themeMode) {
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
                        }),
                        ListTile(
                          leading: const Icon(Icons.photo_library),
                          title: const Text('Загрузить из галереи'),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ErrorPage(
                                  errorMessage: 'автор очень хотел, но не смог',
                                ),
                              ),
                            );
                          },
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
      body: GestureDetector(
        onScaleUpdate: (details) {
          setState(() {
            if (details.scale > _previousScale + 0.5 && _crossAxisCount > 1) {
              // Zoom in
              _crossAxisCount--;
              _previousScale = details.scale;
            } else if (details.scale < _previousScale - 0.5 && _crossAxisCount < 5) {
              // Zoom out
              _crossAxisCount++;
              _previousScale = details.scale;
            }
          });
        },
        onScaleEnd: (details) {
          _previousScale = 1.0; // Reset the scale after the gesture ends
        },
        child: Consumer<PhotoController>(
          builder: (context, photoController, child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1.0,
              ),
              itemCount: photoController.photos.length,
              itemBuilder: (context, index) {
                final photo = photoController.photos[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarouselPage(
                          initialIndex: index,
                          photos: photoController.photos.map((photo) => photo.imagePath).toList(),
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'photo_$index',
                    child: FutureBuilder<bool>(
                      future: _fileExists(photo.imagePath),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData && snapshot.data == true) {
                          return Image.file(File(photo.imagePath), fit: BoxFit.cover);
                        } else {
                          return Image.asset('assets/images/placeholder.png', fit: BoxFit.cover);
                        }
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> _fileExists(String path) async {
    try {
      final file = File(path);
      return await file.exists();
    } catch (e) {
      return false;
    }
  }

  String _themeModeToString(CustomThemeMode themeMode) {
    switch (themeMode) {
      case CustomThemeMode.light:
        return 'Светлая тема';
      case CustomThemeMode.dark:
        return 'Темная тема';
      default:
        return '';
    }
  }
}
