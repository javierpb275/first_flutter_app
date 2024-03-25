import 'package:first_flutter_app/centered_button.dart';
import 'package:first_flutter_app/centered_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QUIZ APP'),
          titleTextStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CenteredImage(
                imageUrl: 'assets/images/quiz/quiz-logo.png',
                imageType: ImageType.asset,
                width: 300,
                height: 300,
              ),
              SizedBox(height: 50),
              CenteredButton(
                text: 'Start Quiz',
                onPressed: null,
                width: 200,
                height: 50,
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
      ),
    );
  }
}
