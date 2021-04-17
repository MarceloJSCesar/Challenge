import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _indexPos = 0;

  final _question = const [
    {
      'question': 'What\'s your favorite food?',
      'answers': [
        {
          'answer': 'Fish',
        },
        {'answer': 'FullDice'}
      ],
    },
    {
      'question': 'What\'s your favorite animal?',
      'answers': [
        {
          'answer': 'Dog',
        },
        {'answer': 'Monkey'}
      ],
    },
    {
      'question': 'What\'s my name?',
      'answers': [
        {
          'answer': 'Marcelo',
        },
        {'answer': 'Paulo'},
        {'answer': 'Joe'}
      ],
    }
  ];
  void nextQuestion() {
    setState(() {
      _indexPos += 1;
    });
  }

  void questionAgain(int value) {
    setState(() {
      _indexPos = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: _indexPos < _question.length
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            _indexPos > 0
                                ? Container(
                                    color: Colors.greenAccent,
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_left),
                                      onPressed: () =>
                                          questionAgain(_indexPos - 1),
                                    ),
                                  )
                                : Container(),
                            Container(
                              color: Colors.greenAccent,
                              child: IconButton(
                                icon: Icon(Icons.arrow_right),
                                onPressed: () => nextQuestion(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(_question[_indexPos]['question']),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                ...(_question[_indexPos]['answers']
                                        as List<Map<String, Object>>)
                                    .map((answer) {
                                  return TextButton(
                                    child: Text(
                                      answer['answer'],
                                    ),
                                    onPressed: () => nextQuestion(),
                                  );
                                }).toList(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : TextButton(
                    onPressed: () => questionAgain(0), child: Text('Again')),
          ),
        ),
      ),
    );
  }
}
