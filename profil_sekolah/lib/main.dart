import 'package:flutter/material.dart';
import 'package:profil_sekolah/splash.dart';
import 'package:profil_sekolah/splashLogin.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
