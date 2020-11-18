import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'dart:async';

class AnimalTiga extends StatefulWidget {
  @override
  _AnimalTigaState createState() => _AnimalTigaState();
}

class _AnimalTigaState extends State<AnimalTiga> {
  String _wallpaperAsset = 'Unknown';
  void initState() {
    super.initState();
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> setWallpaperFromAsset() async {
    setState(() {
      _wallpaperAsset = "Loading";
    });
    String result;
    String assetPath = "assets/images/animal3.jpg";
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await WallpaperManager.setWallpaperFromAsset(
          assetPath, WallpaperManager.HOME_SCREEN);
    } on PlatformException {
      result = 'Failed to get wallpaper.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _wallpaperAsset = result;
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    Scaffold(
      appBar: AppBar(
        title: Text("Animal3"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/animal3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Set wallpaper from asset"),
                onPressed: setWallpaperFromAsset,
              ),
              Center(
                child: Text('Wallpaper status: $_wallpaperAsset\n'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
