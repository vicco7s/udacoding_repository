import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notte_simple_app/Page/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf7f7f7),
          body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/loading.gif",height: 100,width: 100),
              SizedBox(height: 20,),
              Text('Catat Keseharian Anda disini !', style: TextStyle(fontSize: 20,color: Colors.blue),),
            ],
          ), 
        ),
      ),
    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 5), onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}