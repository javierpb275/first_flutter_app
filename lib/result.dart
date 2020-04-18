import 'package:flutter/material.dart';


class Result extends StatelessWidget {

  int totalScore;
  final Function resetHandler;


  Result(int totalScore, this.resetHandler) {
    this.totalScore = totalScore;
  }

  String resultPhrase() {
    String resultText;
    if (this.totalScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (this.totalScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (this.totalScore <= 16) {
      resultText = 'You are... strange?!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column (
        children: <Widget>[
          Text(
            resultPhrase(),
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
          FlatButton(
            child: Text(
                'Restart Quiz!'
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
        ),
    );
  }
}