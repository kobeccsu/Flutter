import 'package:first_flutter/quiz.dart';
import 'package:first_flutter/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite anminal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Lion', 'score': 5},
        {'text': 'Duck', 'score': 2},
        {'text': 'Chicken', 'score': 1}
      ],
    },
    {
      'questionText': 'Who\'s your favorite super star?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Kobe', 'score': 1},
        {'text': 'Dunk', 'score': 1},
        {'text': 'Geogre', 'score': 1}
      ],
    },
  ];

  var _totalScore = 0;

  void _answerQustion(int score) {
    if (_questionIndex < _questions.length) {
      print('we have questions');
    }

    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQustion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
