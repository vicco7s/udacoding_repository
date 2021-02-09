import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wisata_app/page/homepage.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  void initState() {
    StartTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Image.asset('images/logo.jpg'),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<Timer> StartTimer() async {
    return Timer(Duration(seconds: 3), onDone);
  }

  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
