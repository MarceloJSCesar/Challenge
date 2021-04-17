import 'package:flutter/material.dart';
import './views/home_view.dart';

void main() => runApp(Challenge());

class Challenge extends StatelessWidget {
  @override
  MaterialApp build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
