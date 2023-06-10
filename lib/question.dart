// ignore_for_file: non_constant_identifier_names

class Question {
  String QuestionText = '';
  String QuestionImage = '';
  bool questionAnswer = false;
  Question({required String q, required String i, required bool a}) {
    this.QuestionText = q;

    this.QuestionImage = i;
    this.questionAnswer = a;
  }
}
