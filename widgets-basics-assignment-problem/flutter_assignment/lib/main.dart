import 'package:flutter/material.dart';
import 'package:flutter_assignment/ColorProperties.dart';
import 'package:flutter_assignment/ColorsList.dart';
import 'package:flutter_assignment/ControlButtons.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _colors = ColorsList.List;

  var _colorsIndex = 0;

  void forward() {
    setState(() {
      if (_colorsIndex < _colors.length - 1) {
        _colorsIndex++;
      } else {
        _colorsIndex = 0;
      }
      print('forward: $_colorsIndex');
    });
  }

  void backward() {
    setState(() {
      if (_colorsIndex > 0) {
        _colorsIndex--;
      } else {
        _colorsIndex = _colors.length - 1;
      }
      print('backward: $_colorsIndex');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Assignment"),
            ),
            body: Center(
                child: Column(
              children: [
                ColorProperties(
                  name: _colors[_colorsIndex]['name'] as String,
                  rgbCode: _colors[_colorsIndex]['decCode'] as String,
                  hexCode: _colors[_colorsIndex]['hexCode'] as String,
                  colorRGB: _colors[_colorsIndex]['color'] as Color,
                ),
                ControlButtons(forward: forward, backward: backward)
              ],
            ))));
  }
}
