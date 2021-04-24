import 'package:flutter/material.dart';

class CustomButtonPrevious extends StatelessWidget {
  final Function previousQuestion;
  CustomButtonPrevious(this.previousQuestion);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 30,
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border.all(color: Colors.grey.shade100),
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(color: Colors.black),
            ]),
        child: Icon(
          Icons.keyboard_arrow_left_outlined,
          color: Colors.grey,
          size: 30,
        ),
      ),
      onTap: previousQuestion,
    );
  }
}
