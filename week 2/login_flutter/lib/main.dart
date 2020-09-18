import 'package:flutter/material.dart';
import 'package:login_flutter/loginscreen.dart';
import 'package:login_flutter/pilihan.dart';
import 'package:login_flutter/signupscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginSignup(),
        '/login' : (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
      },
    );
  }
}