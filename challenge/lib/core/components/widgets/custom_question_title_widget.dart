import 'package:flutter/material.dart';
import '../text_style_component.dart';

class CustomQuestionTitle extends StatelessWidget {
  final String questionTitle;
  CustomQuestionTitle(this.questionTitle);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(questionTitle, style: StyleText.questionTitleStyle),
    );
  }
}
