import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectedHandler;

  Answer(this.answerText, this.selectedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: RaisedButton(
        color: Colors.red,
        child: Text(answerText),
        textColor: Colors.white,
        onPressed: selectedHandler,
      ),
    );
  }
}
