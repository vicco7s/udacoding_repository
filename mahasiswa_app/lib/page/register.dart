import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:karyawan_app/components/componen.dart';
import 'package:karyawan_app/constant/cons.dart';
import 'package:karyawan_app/helper/userlogin.dart';
import 'package:karyawan_app/model/loginmodel.dart';
import 'dart:convert';

import 'package:karyawan_app/widget/textfield.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
//deklarasi sebuah variable

class _SignUpPageState extends State<SignUpPage> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController pass = TextEditingController();


  //melihat password atau menutup password
   bool _secureText = true;

  showHide() {
   setState(() {
     _secureText = !_secureText;
    });
  }

  @override
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
                controlerText: mail,
                texthint: 'Email',
             ), 
            ),
            SizedBox(height: 20,),
               Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFieldV(
                  isValidation: true,
                // obscureT: _secureText,
                controlerText: pass,
                texthint: 'Password',
                // onPress: showHide,
                // icons: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
             ), 
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                if (_keyForm.currentState.validate()){
                  dataRegister();
                }
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(145, 20, 145, 20),
                decoration:decorenButton,
                child: Text('Sign Up',style: tButtonDuo,)),
            ),

            SizedBox(height: 130,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Sudah Punya Akun  ? ',style: tButtonColor,),
                 InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('Login Sekarang',style: tButtonDuo,), 
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
  dataRegister() {
    DataHapLogin db = DataHapLogin();
    db.createUser(LoginUser(user.text,mail.text,pass.text)).then((value){
      print('succes');
      Navigator.pop(context);
    });
  }
}

