// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, sort_child_properties_last

import 'package:flutter/material.dart';
import 'question.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('اختبار'),
          backgroundColor: Colors.grey,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExampPage(),
        ),
      ),
    );
  }
}

class ExampPage extends StatefulWidget {
  const ExampPage({Key? key}) : super(key: key);

  @override
  State<ExampPage> createState() => _ExampPageState();
}

class _ExampPageState extends State<ExampPage> {
  List<Widget> answerResult = [];
  int rightAnswers = 0;

  void checkAnswer(bool whatUserPicked) {
    setState(() {
      bool correctAnswer = appBrain.getQuestionAnswer();
      if (whatUserPicked == correctAnswer) {
        rightAnswers++;
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.check, color: Colors.green),
          ),
        );
      } else {
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(Icons.close, color: Colors.red),
          ),
        );
      }
      if (appBrain.isFinished()) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Quiz Finished",
          desc: "You are answerd $rightAnswers correct quesstion out of 7",
          buttons: [
            DialogButton(
              child: Text(
                "Start again ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        appBrain.reset();
        answerResult.clear();
        rightAnswers = 0;
      } else {
        appBrain.nextQuestion();
      }
    });
  }

  AppBrain appBrain = AppBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
            flex: 5,
            child: Column(
              children: [
                Image.asset(appBrain.getQuestionImage()),
                SizedBox(
                  height: 20,
                ),
                Text(
                  appBrain.getQuestionText(),
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FlatButton(
            color: Colors.indigo,
            child: Text(
              'صح',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            onPressed: () {
              checkAnswer(true);
            },
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FlatButton(
            color: Colors.redAccent,
            child: Text(
              'خطأ',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            onPressed: () {
              checkAnswer(false);
            },
          ),
        ))
      ],
    );
  }
}
