import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karyawan_app/components/componen.dart';
import 'package:karyawan_app/constant/cons.dart';
import 'package:karyawan_app/helper/userlogin.dart';
import 'package:karyawan_app/model/loginmodel.dart';
import 'package:karyawan_app/page/HomeScreen.dart';
import 'package:karyawan_app/page/register.dart';
import 'package:karyawan_app/widget/textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
//deklarasi sebuah variable
enum statusLogin {signIn, notSignIn}
class _LoginPageState extends State<LoginPage> {
    statusLogin _loginStatus = statusLogin.notSignIn;
  final _keyForm = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  //melihat password atau menutup password
   bool _secureText = true;

  showHide() {
   setState(() {
     _secureText = !_secureText;
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
      return Scaffold(
      body: Form(
        key: _keyForm,
        child: CustomPaint(
         painter: CurvePainter(),
         child: Container(
        alignment: Alignment.bottomCenter,
         child: SingleChildScrollView(
          child: Column(
           children: [
             Container(
               padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
               child: Image.asset("images/logo.png",color: kColorBlue,height: 130,)),
               Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFieldV(
                isValidation: true,
                controlerText: user,
                texthint: 'Username',
             ), 
            ),
            SizedBox(height: 20,),
               Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFieldV(
                isValidation: true,
                controlerText: pass,
                texthint: 'Password',
             ), 
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                sumbitLogin();
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(145, 20, 145, 20),
                decoration: decorenButton,
                child: Text('Sign in',style: tButtonDuo,)),
            ),

            SizedBox(height: 120,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Belum punya akun ? ',style: tButtonColor,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Text('Daftar sekarang',style: tButtonDuo,), 
                 )
               ], 
              ),
            ),

           ], 
          ), 
         ), 
        ),
        ),
      )
    );
  }
  sumbitLogin() {
    DataHapLogin db = DataHapLogin();
    db.getUser(username: user.text, password: pass.text).then((value){
      if (value != null) {
        saveLogin(value);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        print('Username dan password salah coba lagi');
      }
    });
  }

  saveLogin(LoginUser loginData) async {
    SharedPreferences saved = await SharedPreferences.getInstance();
    saved.setString('userData', jsonEncode({
      "id" : loginData.id,
      "email" : loginData.email,
      "username" : loginData.username,
    }));
  }
}
