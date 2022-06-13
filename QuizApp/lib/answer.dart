import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectedHandler;

  Answer(this.answerText, this.selectedHandler);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Theme.of(context).primaryColor, // Color del texto
      primary: Colors.grey[300], // Color del botón
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
      ),
    );
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
