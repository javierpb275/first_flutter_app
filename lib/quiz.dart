import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {

  var questionIndex;

  Function answerQuestion;

  List<Map<String, Object>> questions;

  Quiz(List<Map<String, Object>> questions, Function answerQuestion, int questionIndex) {
    this.questions = questions;
    this.answerQuestion = answerQuestion;
    this.questionIndex = questionIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
