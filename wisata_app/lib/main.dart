import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wisata_app/Splash/splash.dart';
import 'package:wisata_app/page/login.dart';
import 'onboard/onBoardingscreen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        'first' : (context) => LoginPage(),
        'second' : (context) => OnboardingScreen(),
      },
      // home:SplashScreen(),
    );
  }
}
