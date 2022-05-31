import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import 'quiz.dart';
import "result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        "questionText": "What's your favourite color ?",
        "answers": [
          {"text": "Black", "score": 10},
          {"text": "Red", "score": 5},
          {"text": "Blue", " score": 3},
          {"text": "Pink", "score": 1}
        ]
      },
      {
        "questionText": "What's your favourite animal ?",
        "answers": [
          {"text": "Lion", "score": 10},
          {"text": "Tiger", "score": 8},
          {"text": "Dog", "score": 5},
          {"text": "Elephant", "score": 2},
        ]
      },
      {
        "questionText": "Who's your favourite instructor ?",
        "answers": [
          {"text": "Colt", "score": 7},
          {"text": "Max", "score": 9},
          {"text": "Frank", "score": 10},
          {"text": "Angela YU", "score": 3},
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
