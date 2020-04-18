import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  var questions = [
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
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Snake', 'score': 3},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 10},
        ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Pepe', 'score': 5},
        {'text': 'Paco', 'score': 1},
        {'text': 'John', 'score': 3},
        {'text': 'Max', 'score': 10},
      ],
    }
  ];

  runApp(MyApp(questions));

}

class MyApp extends StatefulWidget {
  List<Map<String, Object>> questions;

  MyApp(List<Map<String, Object>> questions) {
    this.questions = questions;
  }

  @override
  State createState() {
    return _MyAppState(questions);
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, Object>> questions;

  _MyAppState(List<Map<String, Object>> questions) {
    this.questions = questions;
  }

  String title = 'Applicacion1';

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    this._totalScore += score;

    setState(() {
      if (this._questionIndex < this.questions.length) {
        _questionIndex = _questionIndex + 1;
      }
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _questionIndex < questions.length
            ? Quiz(questions, _answerQuestion, _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
