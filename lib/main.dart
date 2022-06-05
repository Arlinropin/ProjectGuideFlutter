import 'package:flutter/material.dart';
import 'question.dart';

//void main() {
//  runApp(MyFirstFlutterApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    "Cuál es tu color favorito?",
    "¿Cuál es tu comida favorita?"
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
      } else {
        _questionIndex--;
      }
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Flutter App"),
        ),
        body: Column(
          children: [
            Text('Preguntas'),
            Text(_questions[_questionIndex]),
            ElevatedButton(
                child: Text('Respuesta uno'), onPressed: _answerQuestion),
            Text(_questions.elementAt(1)),
            ElevatedButton(
                child: Text('Respuesta dos'),
                onPressed: () => print('Respuesta dos')),
            ElevatedButton(
                child: Text('Respuesta tres'),
                onPressed: () {
                  print('Respuesta tres');
                }),
          ],
        ),
      ),
    );
  }
}
