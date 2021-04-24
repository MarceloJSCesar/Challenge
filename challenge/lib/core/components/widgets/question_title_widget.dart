import 'package:flutter/material.dart';
import '../text_style_component.dart';

class QuestionTitle extends StatelessWidget {
  final String questionTitle;
  QuestionTitle(this.questionTitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(questionTitle, style: StyleText.questionTitleStyle),
    );
  }
}
