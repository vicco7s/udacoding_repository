import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:profil_sekolah/page/login.dart';

class SplashOut extends StatefulWidget {
  @override
  _SplashOutState createState() => _SplashOutState();
}

class _SplashOutState extends State<SplashOut> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: spinkit,
    );
  }

  final spinkit = SpinKitCubeGrid(
    size: 70.0,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.blue : Colors.green,
        ),
      );
    },
  );

  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 5), onDone);
  }

  void onDone() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
