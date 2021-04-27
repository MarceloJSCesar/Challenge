import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double widht;
  CustomSizedBox({this.widht, this.height});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: widht,
    );
  }
}
