import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    readyCameras();
  }

  Future getCameras() async {
    cameras = await availableCameras();
  }

  Future readyCameras() async {
    await getCameras();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void savePicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    XFile output;
    controller!.setFlashMode(FlashMode.off);
    output = await controller!.takePicture();
    prefs.setString("LATEST_PICTURE", output.path);
    print(output.path);
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 600,
            child: CameraPreview(controller!),),
          ElevatedButton(onPressed: () {
            savePicture();
          }, child: const Text("Take a photo!"))
        ],
      ),)
    );
  }
}
