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
              // Image.asset("images/loading.gif",height: 100,width: 100),
              SizedBox(height: 20,),
              Text('Catat Keseharian Anda disini !',),
            ],
          ), 
        ),
      ),
    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 3),onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}