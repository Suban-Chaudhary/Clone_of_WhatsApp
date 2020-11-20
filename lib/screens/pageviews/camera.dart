import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class HomeCamera extends StatefulWidget {
  final CameraDescription camera;
  HomeCamera({Key key, @required this.camera}) : super(key: key);
  @override
  _HomeCameraState createState() => _HomeCameraState();
}

class _HomeCameraState extends State<HomeCamera> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            var path = join(
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );
            _controller.takePicture(path);
          } catch (e) {
            print(e);
            return null;
          }
        },
      ),
    );
  }
}
