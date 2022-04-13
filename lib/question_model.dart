class QuestionModel {
  late String questionText;
  late bool answer;

  QuestionModel({required String q, required bool a}) {
    questionText = q;
    answer = a;
  }
}
