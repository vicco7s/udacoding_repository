import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.6, -0.6),
        stops: [1, 1, ],
        colors: [
            Color(0xff313131),
            Color(0xff363636), //orange
        ],
        // tileMode: TileMode.repeated,
    ),
  )));
    
  }
}