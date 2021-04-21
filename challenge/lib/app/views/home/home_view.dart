import 'package:flutter/material.dart';
import '../../components/button_next_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _questionIndex = 0;
  final _questions = const [
    {
      'question': 'You have a Dog ?',
      'answers': [
        {'answer': 'YES'},
        {'answer': 'NO'}
      ],
    },
    {
      'question': 'You have a Dog ?',
      'answers': [
        {'answer': 'WOU'},
        {'answer': 'wAA'}
      ],
    },
  ];
  void _nextQuestion(int value) {
    setState(() {
      _questionIndex += value;
    });
  }

  void _previousQuestion(int value) {
    setState(() {
      _questionIndex -= value;
    });
  }

  void _playAgain(int value) {
    setState(() {
      _questionIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _questionIndex < _questions.length
          ? Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 35, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _questionIndex >= 1
                          ? TextButton(
                              onPressed: () =>
                                  _previousQuestion(_questionIndex),
                              child: Icon(Icons.arrow_left))
                          : Container(),
                      ButtonNext(_nextQuestion),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ...(_questions[_questionIndex]['answers']
                              as List<Map<String, Object>>)
                          .map((answer) {
                        return TextButton(
                          child: Text(answer['answer']),
                          onPressed: () => _nextQuestion(_questionIndex),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: TextButton(
                  child: Text('Start Again'), onPressed: () => _playAgain(0)),
            ),
    );
  }
}
