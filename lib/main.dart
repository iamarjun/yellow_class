import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:yellow_class/ui/main_screen.dart';

List<CameraDescription> cameras;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(cameras: cameras,),
    );
  }
}
