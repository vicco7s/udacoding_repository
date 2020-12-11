import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahasiswa_app/components/componen.dart';
import 'package:mahasiswa_app/constant/cons.dart';
import 'package:mahasiswa_app/helper/userlogin.dart';
import 'package:mahasiswa_app/model/loginmodel.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import 'package:mahasiswa_app/widget/textfield.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  FToast fToast;

  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  void _loadButton() async {
    Timer(Duration(seconds: 3), () {
      _btnController.reset();
       if (_keyForm.currentState.validate()){
            dataRegister();
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
                  obscureT: false,
                  texthint: 'Username',
                ), 
            ),
            SizedBox(height: 20,),
             Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFieldV(
                  isValidation: true,
                controlerText: mail,
                obscureT: false,
                texthint: 'Email',
             ), 
            ),
            SizedBox(height: 20,),
               Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextFieldV(
                  isValidation: true,
                obscureT: true,
                controlerText: pass,
                texthint: 'Password',
                // onPress: showHide,
                // icons: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
             ), 
            ),
            SizedBox(height: 30,),
            RoundedLoadingButton(
                child: Text('Sign Up', style: tButtonDuo),
                controller: _btnController,
                onPressed: () {
                    _loadButton();
                },
                color: kColorPink,
            ),

            SizedBox(height: 70,),
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
  // ignore: missing_return
   dataRegister() {
    DatabaseHelperLogin db = DatabaseHelperLogin();
    db.createUser(Admin(user.text,mail.text,pass.text)).then((value){
      _showToast();
      Navigator.pop(context);
    });
  }

  _showToast() {
    Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
        ),
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check,color: Colors.white,),
          SizedBox(width: 12.0,),
          Text("Succes Terdaftar",style: tButtonColor,),
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