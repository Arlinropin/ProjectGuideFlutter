import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

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
  var questions = [
    {
      'questionText': '¿Cuál es tu color favorito?',
      'answers': ['Rosa', 'Azul', 'Amarillo', 'Rojo', 'Verde']
    },
    {
      'questionText': '¿Cuál es tu comida favorita?',
      'answers': ['Pollo', 'Sushi', 'Helado', 'Papas', 'Ensalada']
    },
    {
      'questionText': '¿Cuál es tu animal favorito?',
      'answers': ['Pájaro', 'Gato', 'Perro', 'Pez', 'Osos']
    },
    {
      'questionText': 'Fin de las preguntas',
      'answers': ['Ok']
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex < questions.length - 1) {
        _questionIndex++;
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
            Question('Preguntas'),
            Question(questions[_questionIndex]["questionText"]),
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(answer, _answerQuestion);
            }).toList()
          ],
        ),
      ),
    );
  }
}
