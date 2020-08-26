import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';
import 'package:login_mysql/screen/homescreen.dart';
import 'package:login_mysql/screen/register.dart';
import 'package:http/http.dart' as http;
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
//deklarasi sebuah variable
enum statusLogin {signIn, notSignIn}

class _LoginScreenState extends State<LoginScreen> {
  statusLogin _loginStatus = statusLogin.notSignIn;
  final _keyForm = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  String nUsername, nPassword;

  //melihat password atau menutup password
   bool _secureText = true;

  showHide() {
   setState(() {
     _secureText = !_secureText;
    });
  }

  //cek tombol login
  _doSomething() async {
    Timer(Duration(seconds: 3), () {
        final form = _keyForm.currentState; 
    if (form.validate()){
      form.save();
      submitDataLogin();
      _btnController.success();
    }else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Gagal Login',style: TextStyle(fontSize: 20),),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );
      print('tidak terdaftar databases');
      _btnController.reset();
    }
    });
  }
  
  
  

  // respon and request data to json
  submitDataLogin() async{
    final responseData = await http.post("http://192.168.43.40/Php/login.php",
    body: {
      "username" : nUsername,
      "password" : nPassword,

    });
    final data = jsonDecode(responseData.body);
    int value = data['value'];
    String pesan = data['message'];
    print(data);

    //get data respon
    String dataUsername = data['username'];
    String dataEmail = data['email'];
    String dataAlamat = data['alamat'];
    String dataGender = data['gender'];
    String dataFullname = data['full_name'];
    String dataTanggalDaftar = data['tgl_daftar'];
    String dataIdUser = data['id_user'];

    //cek value 1 or 0
    if (value == 1) {
      setState(() {
        //status login sebagai login
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('login Succes',style: TextStyle(fontSize: 20)),
              content: Icon(Icons.check,color: Colors.green,size: 60,),
            );
          }
        );
        _btnController.success();
        _loginStatus = statusLogin.signIn;
        // save data to prefarence pub package
        saveDataPref(value,dataIdUser,dataUsername,dataEmail,dataAlamat,dataGender,dataFullname,dataTanggalDaftar);
      });
    }else if (value == 2){
      setState(() {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(pesan,style: TextStyle(fontSize: 20)),
              content: Icon(Icons.error,color: Colors.red,size: 60),
            );
          }
        );
        print(pesan);
        _btnController.reset();
      });
    }else{
      setState(() {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(pesan,style: TextStyle(fontSize: 20)),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );
        print(pesan);
        _btnController.reset();
      });
      
    }
  } 

  //method for save share prefer
  saveDataPref(int value, String dUsername,dIdUser,dEmail,dAlamat,dGender,dFullname,dCreated )async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      sharedPreferences.setInt("value", value);
      sharedPreferences.setString("username", dUsername);
      sharedPreferences.setString("id_user", dIdUser);
      sharedPreferences.setString("email", dEmail);
      sharedPreferences.setString("alamat", dAlamat);
      sharedPreferences.setString("gender", dGender);
      sharedPreferences.setString("full_name", dFullname);
      sharedPreferences.setString("tgl_daftar", dCreated);
    });
  } // this method use for check what user already to login or else
  // if already to set values

  getDataPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      int nValue = sharedPreferences.getInt("value");
      _loginStatus = nValue == 1 ? statusLogin.signIn : statusLogin.notSignIn;
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
               child: Image.asset("images/logo.png",color: kColorBlue,height: 130,)),
               Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'username harus di isi';
                  }
                  return null;
                },
                onSaved: (value) => nUsername = value,
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
                obscureText: _secureText,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password harus di isi';
                  }else if (value.length < 6) {
                    return 'password  tidak boleh kurang dari 6 carakter';
                  }
                  return null;
                },
                onSaved: (value) => nPassword = value,
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
            RoundedLoadingButton(
                color: kColorPink,
                child: Text('Sign In',style: TextStyle(color: Colors.white),),
                controller: _btnController,
                onPressed: (){_doSomething();},
              ),
            SizedBox(height: 130,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Belum punya akun ? ',style: tButtonColor,),
                 InkWell(
                  onTap: (){
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUpScreen()));
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
    return HomeScreen(signOut: signOut,nama: nUsername,);
    break;
    }
  }
}