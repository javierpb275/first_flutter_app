import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String textButton;

  final Function selectHandler;

  Answer(this.selectHandler, this.textButton);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
          textColor: Colors.white,
          child: Text(this.textButton),
          onPressed: this.selectHandler,
      ),
    );
  }
}