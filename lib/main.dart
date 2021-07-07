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
      'answers': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'questionText': 'What\'s your favorite anminal?',
      'answers': ['Rabbit', 'Lion', 'Duck', 'Chicken'],
    },
    {
      'questionText': 'Who\'s your favorite super star?',
      'answers': ['Max', 'Kobe', 'Dunk', 'Geogre'],
    },
  ];

  void _answerQustion() {
    if (_questionIndex < _questions.length) {
      print('we have questions');
    }

    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);
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
            : Result(),
      ),
    );
  }
}
