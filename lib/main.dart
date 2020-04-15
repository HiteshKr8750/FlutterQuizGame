import 'package:flutter/material.dart';
import 'package:flutterapp/Result.dart';
import 'package:flutterapp/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = const [
    {
      'questionText': 'Whts your favourite color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 15},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 30}
      ]
    },
    {
      'questionText': 'Whats your favourite anumail',
      'answers': [
        {'text': 'Rabbit', 'score': 20},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 40},
        {'text': 'Lion', 'score': 50}
      ]
    },
  ];

  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print('No more question available');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hitesh App on Flutter '),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_answerQuestion, _questions, _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
