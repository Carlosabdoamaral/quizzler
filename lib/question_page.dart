import 'package:flutter/material.dart';
import 'package:quizzler/question_model.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> _scoreKeeper = [];

  List<QuestionModel> _questions = [
    QuestionModel(
        q: 'You can lead a cow down stairs but not up stairs', a: false),
    QuestionModel(
        q: 'Approximately one quarter of human bones are in the feet', a: true),
    QuestionModel(q: 'A slug\' blood is green', a: true),
  ];

  int _current_question_id = 0;

  resetQuestions() {
    setState(() {
      _scoreKeeper = [];
      _current_question_id = 0;
    });
  }

  appendAnswer(_answer) {
    if (_answer == _questions[_current_question_id].answer) {
      setState(() {
        _scoreKeeper.add(
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      });
    } else {
      setState(() {
        _scoreKeeper.add(
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      });
    }

    if (_current_question_id < _questions.length) {
      _current_question_id++;
    } else {
      _current_question_id = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 225, 225, 225),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quizzler",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
              ),
            ),
            Expanded(
              flex: 0,
              child: Row(
                children: _scoreKeeper,
              ),
            ),
          ],
        ),
        toolbarHeight: 90,
        actions: [
          GestureDetector(
            onTap: () => resetQuestions(),
            child: Text("Reset"),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _questions[_current_question_id].questionText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),

            //TODO: Add buttons
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => appendAnswer(true),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.green, Colors.greenAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "True",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => appendAnswer(false),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.redAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "False",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
