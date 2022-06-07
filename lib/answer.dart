import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectedHandler;

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Color.fromARGB(255, 171, 0, 9), // Color del texto
    primary: Colors.grey[300], // Color del botón
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(18)),
    ),
  );

  Answer(this.answerText, this.selectedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        style: raisedButtonStyle,
        child: Text(
          answerText,
          style: TextStyle(fontSize: 16),
        ),
        onPressed: selectedHandler,
      ),
    );
  }
}
