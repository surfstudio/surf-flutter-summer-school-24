import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'image_carousel.dart';
import 'yandex_disk_utils.dart';

class ImageGridPage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkTheme;

  ImageGridPage({required this.toggleTheme, required this.isDarkTheme});

  @override
  _ImageGridPageState createState() => _ImageGridPageState();
}

class _ImageGridPageState extends State<ImageGridPage> {
  final ImagePicker _picker = ImagePicker();
  List<String> _imageUrls = [];
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _loadImagesFromYandexDisk();
  }

  Future<void> _loadImagesFromYandexDisk() async {
    final uri = Uri.https(
      'cloud-api.yandex.net',
      'v1/disk/resources/files',
      {
        "path": "/",
        "limit": "100",
      },
    );

    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.authorizationHeader: 'OAuth $yandexDiskToken',
      },
    );

    final body = response.body;
    final json = jsonDecode(body);
    final items = json['items'] as List<dynamic>;

    setState(() {
      _imageUrls = items.map((item) => item['name'] as String).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Постogram',
          style: TextStyle(
            fontFamily: 'billabong',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showBottomMenu(context, -1); // -1 to indicate no specific image selected
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: _imageUrls.length,
            itemBuilder: (context, index) {
              final imageName = _imageUrls[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          ImageCarouselPage(
                            imageUrls: _imageUrls,
                            initialIndex: index,
                          ),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.ease;

                        final tween = Tween(begin: begin, end: end);
                        final curvedAnimation = CurvedAnimation(
                          parent: animation,
                          curve: curve,
                        );

                        return SlideTransition(
                          position: tween.animate(curvedAnimation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                onLongPress: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                  _showDeleteConfirmationDialog(context, index);
                },
                child: Container(
                  child: FutureBuilder<File>(
                    future: loadImageFromYandexDisk(imageName),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error loading image'));
                      } else if (snapshot.hasData) {
                        return ShaderMask(
                          blendMode: BlendMode.srcOver,
                          shaderCallback: (bounds) {
                            return LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                              tileMode: TileMode.clamp,
                            ).createShader(bounds);
                          },
                          child: Image.file(
                            snapshot.data!,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return Center(child: Text('No image'));
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showBottomMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.brightness_4),
                title: Text('Тема'),
                trailing: Text(widget.isDarkTheme ? 'Тёмная' : 'Светлая'),
                onTap: () {
                  widget.toggleTheme();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.add_a_photo),
                title: Text('Загрузить фото'),
                onTap: () {
                  _pickImage();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Удалить фото'),
                onTap: () async {
                  await deleteImageFromYandexCloud(_imageUrls[index]);
                  setState(() {
                    _imageUrls.removeAt(index);
                    _selectedIndex = null;
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    try {
      final status = await Permission.photos.request();
      if (status.isGranted) {
        final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          await uploadImageToYandexCloud(pickedFile.path);
          setState(() {
            _imageUrls.insert(0, pickedFile.name); // Insert at the beginning
          });
        }
      } else {
        print('Permission denied');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}
