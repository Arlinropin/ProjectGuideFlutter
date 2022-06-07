import 'package:flutter/material.dart';

class ColorProperties extends StatelessWidget {
  final Color colorRGB;
  final String name;
  final String rgbCode;
  final String hexCode;

  ColorProperties(
      {required this.name,
      required this.rgbCode,
      required this.hexCode,
      required this.colorRGB});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: colorRGB,
          width: 100,
          height: 100,
          margin: EdgeInsets.all(30),
        ),
        Text(
          'Color: $name',
          style: TextStyle(fontSize: 20),
        ),
        Text('Código RGB: $rgbCode\nCódigo hexadécimal: $hexCode',
            style: TextStyle(fontSize: 16)),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
