import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButtonNext extends StatelessWidget {
  final Function nextQuestion;
  CustomButtonNext(this.nextQuestion);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 56,
        height: 38,
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.green.shade300,
            border: Border.all(color: Colors.green.shade300),
            borderRadius: BorderRadius.circular(5.0)),
        child: Icon(
          FontAwesomeIcons.arrowRight,
          color: Colors.white,
          size: 18,
        ),
      ),
      onTap: nextQuestion,
    );
  }
}
