import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class/widgets/camera_widget.dart';
import 'package:yellow_class/widgets/video_player.dart';

class MainScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  MainScreen({Key key, this.cameras}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Stack(
            children: [
              VideoPlayerWidget(),
              CameraWidget(
                cameras: widget.cameras,
                initPos: Offset(0.0, 0.0),
                label: '',
                itemColor: Colors.lightGreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
