import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_mysql/constant/constant.dart';
import 'package:login_mysql/screen/login.dart';

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
    return Container(
      child: Center(
        child: Image.asset("images/splashscreen.gif"), 
      ),
    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 5), onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}