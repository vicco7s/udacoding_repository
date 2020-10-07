import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karyawan_app/page/login.dart';

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
      color: Colors.white,
      child: Center(
       child: Image.asset('images/loading.gif'), 
      ),
    );
  }
  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 10), onDone);
  }
  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}