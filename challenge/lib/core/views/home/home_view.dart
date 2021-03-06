import 'package:flutter/cupertino.dart';
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
  final _questionHomeStore = QuestionHomeStore();
  final _questions = const [
    {
      'question': 'You have a Dog ?',
      'answers': [
        {'answer': 'YES'},
        {'answer': 'NO'}
      ],
    },
    {
      'question': 'First Computer Invented ?',
      'answers': [
        {'answer': 'Obacus'},
        {'answer': 'Anilitc Machine'},
        {'answer': 'Pascaline'}
      ],
    },
    {
      'question': 'My name ?',
      'answers': [
        {'answer': 'Marcelo'},
        {'answer': 'Mauro'},
        {'answer': 'D Jordan'}
      ],
    },
  ];

  Widget showAsnwers(String answer) {
    if (_questionHomeStore.questionIndex == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30)),
            child: TextButton(
              child: Text(answer),
              onPressed: _questionHomeStore.nextQuestion,
            ),
          ),
        ],
      );
    } else if (_questionHomeStore.questionIndex == 1) {
      return TextButton(
        child: Text('1' + answer),
        onPressed: _questionHomeStore.nextQuestion,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (context) {
      if (_questionHomeStore.questionIndex < _questions.length) {
        return Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(10, 35, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _questionHomeStore.questionIndex >= 1
                      ? CustomButtonPrevious(
                          _questionHomeStore.previousQuestion)
                      : Container(),
                  CustomSizedBox(widht: 20),
                  CustomButtonNext(_questionHomeStore.nextQuestion),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomQuestionTitle(
                      _questions[_questionHomeStore.questionIndex]['question']),
                  CustomSizedBox(height: 30),
                  if (_questionHomeStore.questionIndex == 0)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...(_questions[_questionHomeStore.questionIndex]
                                  ['answers'] as List<Map<String, Object>>)
                              .map((answer) {
                            return Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(30)),
                              child: TextButton(
                                child: Text(
                                  answer['answer'],
                                  style: TextStyle(fontSize: 30),
                                ),
                                onPressed: _questionHomeStore.nextQuestion,
                              ),
                            );
                          }).toList(),
                        ]),
                  if (_questionHomeStore.questionIndex == 1)
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...(_questions[_questionHomeStore.questionIndex]
                                    ['answers'] as List<Map<String, Object>>)
                                .map(
                              (answer) {
                                return TextButton(
                                  child: Text(answer['answer']),
                                  onPressed: _questionHomeStore.nextQuestion,
                                );
                              },
                            )
                          ]),
                    ),
                  if (_questionHomeStore.questionIndex == 2)
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 200,
                        color: Colors.white,
                        child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            onSelectedItemChanged: (val) {
                              print(val);
                            },
                            itemExtent: 40,
                            children: <Widget>[
                              ...(_questions[_questionHomeStore.questionIndex]
                                      ['answers'] as List<Map<String, Object>>)
                                  .map((answer) {
                                return GestureDetector(
                                    child: Text(
                                      answer['answer'],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onTap: _questionHomeStore.nextQuestion);
                              }).toList(),
                            ]),
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      } else {
        return Center(
            child: TextButton(
                child: Text('Start Again'),
                onPressed: () => _questionHomeStore.playAgain()));
      }
    }));
  }
}
