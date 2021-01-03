import 'dart:async';
import 'package:flutter/material.dart';
import 'page/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

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
    return Timer(Duration(seconds: 2), onDone);
  }

  void onDone() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
