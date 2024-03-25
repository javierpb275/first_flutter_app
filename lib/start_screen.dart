import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz/quiz-logo.png',
            width: 300,
          ),
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Answer the questions correctly',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
            onPressed: () {
              debugPrint('Received click');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.white,
                  width: 5.0,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
