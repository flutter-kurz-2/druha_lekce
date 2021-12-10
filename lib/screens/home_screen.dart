import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'camera_screen.dart';
import 'gallery_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool english = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }
  
  void toggle() {
    setState(() {
      english = !english;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (english) const Text('English')
              else const Text('Čeština')
            ],
          ),
          Switch(value: english, onChanged: (value) {
            setState(() {
              english = value;
            });
          }, activeColor: Colors.white24, )
        ],
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Column(
          children: <Widget>[
            if (english) const Text('Home Screen')
            else const Text('Domovská obrazovka')
          ],
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ));
                },
                child: Column(
                  children: <Widget>[
                    if (english) const Text('Simple game')
                    else const Text('Jednoduchá hra')
                  ],
                ) ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CameraScreen(),
                      ));
                },
                child: Column(
                  children: <Widget>[
                    if (english) const Text('Camera')
                    else const Text('Fotoaparát')
                  ],
                ) ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GalleryScreen(),
                      ));
                },
                child: Column(
                  children: <Widget>[
                    if (english) const Text('Gallery')
                    else const Text('Galerie')
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
