import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;

  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhares {
    String resultText;
    if (totalScore < 30) {
      resultText = 'you are failed !';
    } else {
      resultText = 'you passed !';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultPhares,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart Quiz !'),
          textColor: Colors.blue,
          onPressed: resetQuiz,
        )
      ],
    ));
  }
}
