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
          margin: const EdgeInsets.all(30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(color: colorRGB, width: 100, height: 100),
          ),
        ),
        Text('Color: $name',
            style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
        Text('Código RGB: $rgbCode\nCódigo hexadécimal: $hexCode',
            style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
