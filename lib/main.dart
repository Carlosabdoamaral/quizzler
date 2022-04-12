import 'package:flutter/material.dart';
import 'package:quizzler/question_page.dart';

void main() {
  runApp(PageController());
}

class PageController extends StatelessWidget {
  const PageController({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuestionPage(),
    );
  }
}