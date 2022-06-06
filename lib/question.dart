import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String
      questionText; // 'final' es para decir que el valor no cambiara una vez se inicialice.

  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20, top: 12),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
