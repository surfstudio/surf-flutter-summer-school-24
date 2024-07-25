import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:surf_flutter_summer_school_24/features/camera_view/widgets/widgets.dart';

@RoutePage()
class CameraViewScreen extends StatefulWidget {
  const CameraViewScreen({super.key});

  @override
  State<CameraViewScreen> createState() => _CameraViewScreenState();
}

class _CameraViewScreenState extends State<CameraViewScreen> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  bool _isFlashOn = false;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras.isNotEmpty) {
      _controller = CameraController(_cameras[0], ResolutionPreset.high);
      await _controller.initialize();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePhoto(BuildContext context) async {
    if (!_controller.value.isInitialized) {
      return;
    }

    // Получение пути к внешнему хранилищу
    final Directory? extDir = await getExternalStorageDirectory();
    if (extDir == null) {
      return;
    }
    // Путь к папке Screenshots в DCIM
    final String dirPath = '${extDir.path}/DCIM/Screenshots';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '${dirPath}/${_getTimestamp()}.jpg';

    if (_controller.value.isTakingPicture) {
      return;
    }

    try {
      XFile picture = await _controller.takePicture();
      await picture.saveTo(filePath);
    } catch (e) {
      print(e);
    }
  }

  String _getTimestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _isCameraInitialized
              ? CameraPreview(_controller)
              : Center(child: CircularProgressIndicator()),
          Positioned(
            top: 40,
            right: 20,
            child: CloseButtonWidget(),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: CaptureButtonWidget(onPressed: () async {
                await _takePhoto(context);
                setState(() {
                  _isFlashOn = true;
                });
                Future.delayed(Duration(milliseconds: 150), () {
                  setState(() {
                    _isFlashOn = false;
                  });
                });
              }),
            ),
          ),
          _isFlashOn
              ? Container(
                  color: Colors.white.withOpacity(0.8),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
