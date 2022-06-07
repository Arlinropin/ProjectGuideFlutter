import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultValue;
  final Function resetHandler;

  Result(this.resultValue, this.resetHandler);

  String get resultPhrase {
    String resultText =
        '¡Haz terminado la encuesta!\n Tu puntaje es ' + resultValue.toString();
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Text(resultPhrase,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        TextButton(
            onPressed: resetHandler,
            child: Text(
              'Empezar test nuevamente',
              style: TextStyle(fontSize: 18),
            ))
      ],
    ));
  }
}
