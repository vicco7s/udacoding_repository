import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notte_simple_app/Page/note_home.dart';
import 'package:notte_simple_app/Page/register.dart';
import 'package:notte_simple_app/components/containerpaint.dart';
import 'package:notte_simple_app/constant/constant.dart';
import 'dart:convert';
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
  String username,password;

  //melihat password atau menutup password
   bool _secureText = true;

  showHide() {
   setState(() {
     _secureText = !_secureText;
    });
  }

  Future checklogin() async {
    final form = _keyForm.currentState;
    if (form.validate()) {
      form.save();
      login();
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
                title: Text('Data Belum terisi',style: TextStyle(fontSize: 20),),
                content: Icon(Icons.warning,color: Colors.red,size: 60,),
              );
          }
        );
    }
  }

  Future login() async {
    var url = ('http://192.168.43.40/backend_note/login.php');
    final response = await http.post(url, body: {
      "username" : username,
      "password" : password,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String msg = data['message'];

    String dataId = data['id'];
    String dataUsername = data['username'];
    String dataEmail = data['email'];

    if (value == 1) {
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
        _loginStatus = statusLogin.signIn;
        saveDataPref(value, dataUsername, dataId, dataEmail);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeNotePage()));
        
    } else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
                title: Text('$msg',style: TextStyle(fontSize: 20),),
                content: Icon(Icons.warning,color: Colors.red,size: 60,),
              );
          }
        );
    }
  }

  saveDataPref(int value, String username,id,email )async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("username", username);
      sharedPreferences.setString("id", id);
      sharedPreferences.setString("email", email);
    });
  } 

  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      int values = sharedPreferences.getInt("value");
      _loginStatus = values == 1 ? statusLogin.signIn : statusLogin.notSignIn;
    });
  } 
  signOut() async {
   SharedPreferences sharedpreferences = await SharedPreferences.getInstance();
   setState(() {
     sharedpreferences.setInt("value", null);
     // ignore: deprecated_member_use
     sharedpreferences.commit();
     _loginStatus = statusLogin.notSignIn;
   });
 }

  @override
  void initState() { 
    super.initState();
    getDataPref();
  }


  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case statusLogin.notSignIn :
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
                obscureText: _secureText,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password harus di isi';
                  }else if (value.length < 6) {
                    return 'password  tidak boleh kurang dari 6 carakter';
                  }
                  return null;
                },
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
            SizedBox(height: 50,),
            GestureDetector(
              onTap: () {
                checklogin();
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
    break;
    case statusLogin.signIn : 
    return HomeNotePage(signOut: signOut,);
    break;
  }
}

}