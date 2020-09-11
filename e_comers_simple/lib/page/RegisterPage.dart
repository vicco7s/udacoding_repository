import 'dart:async';

import 'package:e_comers_simple/components/componen.dart';
import 'package:e_comers_simple/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  String username,email,password;


  //melihat password atau menutup password
   bool _secureText = true;

  showHide() {
   setState(() {
     _secureText = !_secureText;
    });
  }
  Future checForm() async {
    final form = _keyForm.currentState; 
    if(form.validate()) {
      form.save();
      register();
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Gagal !',style: TextStyle(fontSize: 20),),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );
    }
  }

  Future register() async {
    var url = ('http://192.168.43.40/backend_note/register.php');
    final response = await http.post(url , body: {
      "username" : username,
      "email" : email,
      "password" : password,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String msg = data['message'];

    if (value == 1 ) {
      setState(() {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
                title: Text('$msg',style: TextStyle(fontSize: 20),),
                content: Icon(Icons.check,color: Colors.green,size: 60,),
              );
          }
        );
      });
    }else if (value == 2 ) {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('$msg',style: TextStyle(fontSize: 20),),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );
      }else {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('$msg',style: TextStyle(fontSize: 20),),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );
      }
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
               child: Image.asset("images/ecommerce.png",color: kColorBlue,height: 130,)),
               Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFormField(
                  validator: (value) {
                  if (value.isEmpty) {
                    return 'Username tidak boleh kosong !!';
                  }
                  return null;
                },
                controller: user,
                onSaved: (value) => username = user.text,
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
                    return 'Email tidak boleh kosong !!';
                  }else if (!value.contains('@')){
                    return 'mohon menggunakan email yang valid';
                  }
                  return null;
                },
                controller: mail,
                onSaved: (value) => email = mail.text,
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
                  validator:  (value) {
                  if (value.isEmpty) {
                    return 'Password tidak boleh kosong !!';
                  }else if (value.length < 6) {
                    return 'password  tidak boleh kurang dari 6 carakter';
                  }
                  return null;
                },
                obscureText: _secureText,
                controller: pass,
                onSaved: (value) => password = pass.text,
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
              onTap: () {
                setState(() {
                  checForm();
                });
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
}