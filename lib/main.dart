import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': '¿Cuál es tu color favorito?',
      'answers': [
        {'text': 'Rosa', 'score': 1},
        {'text': 'Azul', 'score': 2},
        {'text': 'Amarillo', 'score': 3},
        {'text': 'Rojo', 'score': 4},
        {'text': 'Verde', 'score': 5},
      ]
    },
    {
      'questionText': '¿Cuál es tu comida favorita?',
      'answers': [
        {'text': 'Pollo', 'score': 1},
        {'text': 'Sushi', 'score': 2},
        {'text': 'Helado', 'score': 3},
        {'text': 'Papas', 'score': 4},
        {'text': 'Ensalada', 'score': 5},
      ]
    },
    {
      'questionText': '¿Cuál es tu animal favorito?',
      'answers': [
        {'text': 'Pájaro', 'score': 1},
        {'text': 'Gato', 'score': 2},
        {'text': 'Perro', 'score': 3},
        {'text': 'Pez', 'score': 4},
        {'text': 'Osos', 'score': 5},
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First Flutter App"),
        ),
        body: (_questionIndex < questions.length)
            ? Quiz(
                questionIndex: _questionIndex,
                questions: questions,
                answerQuestion: _answerQuestion,
              )
            : Result(_totalScore, restartQuiz),
      ),
    );
  }
}
