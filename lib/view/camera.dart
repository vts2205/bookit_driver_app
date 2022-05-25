import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePhoto extends StatefulWidget {
  const TakePhoto({Key? key}) : super(key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  late CameraController _controller;
  Future<void>? _initializeControllerFuture;
  List<CameraDescription>? _availableCameras;

  @override
  void initState() {
    super.initState();

    _getAvailableCameras();
  }

  Future<void> _getAvailableCameras() async {
    _availableCameras = await availableCameras();
    await _initCamera(_availableCameras!.firstWhere((description) =>
        description.lensDirection == CameraLensDirection.back));
  }

  void _toggleCameraLens() {
    // get current lens direction (front / rear)
    final lensDirection = _controller.description.lensDirection;
    CameraDescription newDescription;
    if (lensDirection == CameraLensDirection.back) {
      newDescription = _availableCameras!.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.front);
    } else {
      newDescription = _availableCameras!.firstWhere((description) =>
          description.lensDirection == CameraLensDirection.back);
    }
    _initCamera(newDescription);
  }

  Future<void> _initCamera(CameraDescription description) async {
    _controller = CameraController(description, ResolutionPreset.ultraHigh);

    try {
      _initializeControllerFuture = _controller.initialize();
      // to notify the widgets that camera has been initialized and now camera preview can be done
      setState(() {});
    } catch (e) {
      // await Sentry.captureException(e, stackTrace: stackTrace);}
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Future<XFile?> takePicture() async {
    if (_controller.value.isTakingPicture) {
      return null;
    }

    try {
      var file = await _controller.takePicture();
      return file;
    } on CameraException catch (_) {
      // await Sentry.captureException(e, stackTrace: stackTrace);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
                onPressed: () {
                  _toggleCameraLens();
                },
                icon: const Icon(Icons.switch_camera_outlined)),
            Expanded(
              child: Stack(
                children: [
                  FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the Future is complete, display the preview.
                        return Container(
                          alignment: Alignment.center,
                          child: CameraPreview(_controller),
                        );
                      } else {
                        // Otherwise, display a loading indicator.
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  Positioned(
                      bottom: 50,
                      left: 0,
                      right: 0,
                      child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            var file = await takePicture();
                            Navigator.of(context).pop(file);
                          },
                          icon: const Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
