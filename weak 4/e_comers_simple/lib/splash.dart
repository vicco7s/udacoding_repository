import 'dart:async';

import 'package:e_comers_simple/constant/constant.dart';
import 'package:e_comers_simple/introduction_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
      backgroundColor: Colors.black,
          body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/ecommerce.png",height: 250,width: 250,color: kColorBlue,),
              // SizedBox(height: 10,),
              Image.asset("images/loading.gif",height: 70, width: 70,),
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
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IntroDuction()));
  }
}