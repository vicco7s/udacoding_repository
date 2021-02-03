import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_app/page/login.dart';

int initScreen;

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
    return Timer(Duration(seconds: 3), onDone);
  }

  Future<void> onDone() async{
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = prefs.getInt("initScreen");
    await prefs.setInt("initScreen", 1);
    print("initScreen $initScreen");
    
    if(initScreen == 1){
      Navigator.of(context).pushReplacementNamed("first");
    }else if(initScreen == null){
      Navigator.of(context).pushReplacementNamed("second");
    }

  }
}
