import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Data tidak boleh kosong !!';
                  }
                  return null;
                },
                //  controller: usernameController,
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
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Data tidak boleh kosong !!';
                  }
                  return null;
                },
                //  controller: usernameController,
                decoration: InputDecoration(
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
            Center(
             child: GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.fromLTRB(117, 20, 117, 20),
                decoration: BoxDecoration(
                  color: kColorPink,
                 borderRadius: BorderRadius.circular(50) 
                ), 
                child: Text('Sign In',style: tColorButton,),
              ), 
             ), 
            ),
            SizedBox(height: 130,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Belum punya akun ? ',style: tButtonColor,),
                 InkWell(
                  onTap: (){},
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
}