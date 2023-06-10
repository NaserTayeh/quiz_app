// ignore_for_file: prefer_final_fields, curly_braces_in_flow_control_structures

import 'question.dart';

class AppBrain {
  int _questionNumber = 0;

  List<Question> _questionGroup = [
    Question(
        q: 'عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب',
        i: 'images/image-1.jpg',
        a: true),
    Question(q: 'الفطط هي حيوانات لاحمة', i: 'images/image-2.jpg', a: true),
    Question(
        q: 'الصين موجودة في القارة الافريقية',
        i: 'images/image-3.jpg',
        a: false),
    Question(q: 'الارض مسطحة وليست كروية', i: 'images/image-4.jpg', a: false),
    Question(
        q: 'باستطاع الانسان البقاء على قيد الحياة بدون اكل اللحوم',
        i: 'images/image-5.jpg',
        a: true),
    Question(
        q: 'الشمس تدور حول الارض والارض تدور حول القمر',
        i: 'images/image-6.jpg',
        a: false),
    Question(q: 'الحيوانات لا تشعر بالالم ', i: 'images/image-7.jpg', a: false),
  ];
  String getQuestionText() {
    return _questionGroup[_questionNumber].QuestionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].QuestionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  void nextQuestion() {
    if (_questionNumber < _questionGroup.length - 1) _questionNumber++;
  }

  bool isFinished() {
    if (_questionNumber >= _questionGroup.length - 1) return true;
    return false;
  }

  void reset() {
    _questionNumber = 0;
  }
}
