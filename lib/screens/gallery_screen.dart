import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  File? image;
  String? path;

  @override
  void initState() {
    super.initState();
    getFile();
  }

  void getFile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    path = prefs.getString("LATEST_PICTURE");
    image = File(path!);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Container(child: Text("NicTuNení"));
    if(image != null) {
      body = Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.file(image!),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text("Gallery"),
        ),
        body: body,
    );
  }
}
