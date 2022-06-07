import 'package:flutter/material.dart';

class ControlButtons extends StatelessWidget {
  final VoidCallback forward;
  final VoidCallback backward;

  ControlButtons({required this.forward, required this.backward});

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Color.fromARGB(255, 171, 0, 9), // Color del texto
    primary: Colors.grey[300], // Color del botón
    minimumSize: Size(50, 36),
    padding: EdgeInsets.symmetric(horizontal: 30),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: backward,
          child: const Text('Atrás'),
          style: raisedButtonStyle,
        ),
        ElevatedButton(
          onPressed: forward,
          child: const Text('Siguiente'),
          style: raisedButtonStyle,
        )
      ],
    );
  }
}
