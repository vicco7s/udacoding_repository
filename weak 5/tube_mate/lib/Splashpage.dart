import 'dart:async';

import 'package:flutter/material.dart';

import 'homePage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/logo.png",height: 150,width: 150,color: Colors.red[600],),
            ],
          ), 
        ),
      ),
    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 5),onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}