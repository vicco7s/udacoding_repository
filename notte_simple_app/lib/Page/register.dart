import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notte_simple_app/components/containerpaint.dart';
import 'package:notte_simple_app/constant/constant.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
//deklarasi sebuah variable

class _SignUpPageState extends State<SignUpPage> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
               child: Image.asset("images/note.png",color: kColorBlue,height: 130,)),
               Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'username harus di isi';
                  }
                  return null;
                },
                onSaved: (value) => username,
                decoration: InputDecoration(
                hintText: 'username',
                hintStyle: kColorField,
                enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorGrey) 
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kColorPink)
                ), 
               ),
             ), 
            ),
            SizedBox(height: 20,),
             Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email harus di isi';
                  }else if (!value.contains('@')){
                    return 'mohon menggunakan email yang valid';
                  }
                  return null;
                },
                onSaved: (value) => email,
                decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: kColorField,
                enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorGrey) 
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kColorPink)
                ), 
               ),
             ), 
            ),
            SizedBox(height: 20,),
               Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                obscureText: _secureText,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password harus di isi';
                  }else if (value.length < 6) {
                    return 'password  tidak boleh kurang dari 6 carakter';
                  }
                  return null;
                },
                onSaved: (value) => password,
                decoration: InputDecoration(
                suffixIcon: IconButton(
                   onPressed: showHide,
                   icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
                 ),
                hintText: 'password',
                hintStyle: kColorField,
                enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kColorGrey) 
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kColorPink)
                ), 
               ),
             ), 
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {},
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
}

