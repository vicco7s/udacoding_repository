
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mahasiswa_app/components/componen.dart';
import 'package:mahasiswa_app/constant/cons.dart';
import 'package:mahasiswa_app/helper/userlogin.dart';
import 'package:mahasiswa_app/model/loginmodel.dart';
import 'package:mahasiswa_app/page/HomeScreen.dart';
import 'package:mahasiswa_app/page/register.dart';
import 'package:mahasiswa_app/widget/textfield.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyForm = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  FToast fToast;

  //melihat password atau menutup password
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  void _loadButton() async{
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
      if(_keyForm.currentState.validate()){
           sumbitLogin();
        }
    });
  }

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context); 
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
                obscureT: false,
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
                obscureT: true,
                texthint: 'Password',
             ), 
            ),
            SizedBox(height: 50,),
             RoundedLoadingButton(
                child: Text('Sign In', style: tButtonDuo),
                controller: _btnController,
                onPressed: _loadButton,
                color: kColorPink,
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
  sumbitLogin() async {
    DataHapLogin dp = DataHapLogin();
    dp.getUser(username: user.text, password: pass.text).then((value){
      if (value != null) {
        saveLogin(value);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        _showToast();
      }
    });
  }

  saveLogin(LoginUser data) async {
    SharedPreferences saved = await SharedPreferences.getInstance();
    saved.setString('userData', jsonEncode({
      "id" : data.id,
      "email" : data.email,
      "username" : data.username,
    }));
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0 , vertical: 12.0),
      decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(25.0),
       color: Colors.red, 
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
       children: [
         Icon(Icons.clear,color: Colors.white,),
          SizedBox(width: 12.0,),
          Text("Username dan password salah",style: tButtonColor,),
       ], 
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 3),
    );
  }

}
