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
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool _loading = false;

  final cUsername = TextEditingController();
  final cPassword = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _loginFormKey = GlobalKey<FormState>();

  FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          body: CustomPaint(
            painter: CurvePainter(),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                          child: Image.asset("images/logo.png",color: kColorBlue,height: 130,)),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextFieldV(
                              isValidation: true,
                              obscureT: false,
                              controlerText: cUsername,
                              texthint: 'Username',
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextFieldV(
                              isValidation: true,
                              controlerText: cPassword,
                              obscureT: true,
                              texthint: 'Password',
                            ),
                          ),
                          SizedBox(height: 50,),
                          GestureDetector(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(120, 15, 120, 15),
                              decoration: BoxDecoration(
                                color: kColorPink,
                               borderRadius: BorderRadius.circular(50), 
                              ),
                              child: Text('Login',style: TextStyle(
                                color: Colors.white,
                                fontSize: 15, 
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                            onTap: () {
                              if (_loginFormKey.currentState.validate()) {
                                // _loading = true;
                                submitDataLogin();
                              }
                            },
                          ),
                          SizedBox(
                            height: 120,
                          ),
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
                ],
              ),
            ),
          )),
    );
  }

  submitDataLogin() {
    DatabaseHelperLogin db = new DatabaseHelperLogin();
    db
        .getUser(username: cUsername.text, password: cPassword.text)
        .then((value) {
      if (value != null) {
        saveData(value);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      } else {
        _showToast();
      }
    });
  }

  saveData(Admin data) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(
        'userData',
        jsonEncode(
            {"id": data.id, "email": data.email, "username": data.username}));
  }

  _showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.red,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.clear,
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Username dan password salah",
            style: tButtonColor,
          ),
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
