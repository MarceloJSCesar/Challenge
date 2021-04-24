import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../store/question_home_store.dart';
import '../../components/widgets/custom_siexBox_widget.dart';
import '../../components/widgets/custom_button_next_widget.dart';
import '../../components/widgets/custom_question_title_widget.dart';
import '../../components/widgets/custom_button_previous_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final questionHomeStore = QuestionHomeStore();
  final _questions = const [
    {
      'question': 'You have a Dog ?',
      'answers': [
        {'answer': 'YES'},
        {'answer': 'NO'}
      ],
    },
    {
      'question': 'You have a Dogi ?',
      'answers': [
        {'answer': 'WOU'},
        {'answer': 'wAA'}
      ],
    },
  ];
  // void _nextQuestion() {
  //   setState(() {
  //     _questionIndex += 1;
  //   });
  // }

  // void _previousQuestion() {
  //   setState(() {
  //     _questionIndex -= 1;
  //   });
  // }

  // void _playAgain(int value) {
  //   setState(() {
  //     _questionIndex = value;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (context) {
      return questionHomeStore.questionIndex < _questions.length
          ? Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 35, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      questionHomeStore.questionIndex >= 1
                          ? CustomButtonPrevious(
                              questionHomeStore.previousQuestion)
                          : Container(),
                      CustomSizedBox(widht: 20),
                      CustomButtonNext(questionHomeStore.nextQuestion),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CustomQuestionTitle(
                          _questions[questionHomeStore.questionIndex]
                              ['question']),
                      ...(_questions[questionHomeStore.questionIndex]['answers']
                              as List<Map<String, Object>>)
                          .map((answer) {
                        return TextButton(
                          child: Text(answer['answer']),
                          onPressed: questionHomeStore.nextQuestion,
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: TextButton(
                  child: Text('Start Again'),
                  onPressed: () => questionHomeStore.playAgain()),
            );
    }));
  }
}
