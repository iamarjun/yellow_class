import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraWidget extends StatefulWidget {
  final Offset initPos;
  final String label;
  final Color itemColor;
  final List<CameraDescription> cameras;
  CameraWidget(
      {Key key,
      this.initPos,
      this.label,
      this.itemColor,
      @required this.cameras})
      : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  Offset position = Offset(0.0, 0.0);
  CameraController _controller;

  @override
  void initState() {
    super.initState();
    position = widget.initPos;
    _controller = CameraController(widget.cameras[1], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }

    // return NativeDeviceOrientationReader(
    //   builder: (context) {
    //     NativeDeviceOrientation orientation =
    //         NativeDeviceOrientationReader.orientation(context);

    //     int turns;
    //     switch (orientation) {
    //       case NativeDeviceOrientation.landscapeLeft:
    //         turns = -1;
    //         break;
    //       case NativeDeviceOrientation.landscapeRight:
    //         turns = 1;
    //         break;
    //       case NativeDeviceOrientation.portraitDown:
    //         turns = 2;
    //         break;
    //       default:
    //         turns = 0;
    //         break;
    //     }

    //   },
    // );
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        data: widget.itemColor,
        child: Container(
          width: 120.0,
          height: 180.0,
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: CameraPreview(_controller),
          ),
        ),
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            position = offset;
          });
        },
        feedback: Opacity(
          opacity: 0.5,
          child: Container(
            width: 120.0,
            height: 180.0,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: CameraPreview(_controller),
            ),
          ),
        ),
      ),
    );
  }
}
