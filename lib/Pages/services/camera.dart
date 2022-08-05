import 'profiledata.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  bool _isLoading = true;
  late List<CameraDescription> cameras;
  late CameraDescription firstCam;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  /// Class function to get camera data
  void getCameras() async {
    cameras = await availableCameras();
    firstCam = cameras[1];
    _controller = CameraController(
      firstCam,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
    setState(() {
      _isLoading = false;
    });
  }
  @override
  void initState() {
    getCameras();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ProfileData pd = ModalRoute.of(context)!.settings.arguments as ProfileData;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Picture"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          if (_isLoading) ...[
            const Center(child: CircularProgressIndicator())
          ] else ...[
            FutureBuilder(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            FloatingActionButton(onPressed: () async {
              try {
                await _initializeControllerFuture;
                XFile image = await _controller.takePicture();
                pd.changeImage(image.path);
                pd.writeFile();
                if (!mounted) return;
                Navigator.pop(context);
              } catch (e) {
                throw Exception(e);
              }
            }),
          ]
        ],
      ),
    );
  }
}
