import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:rounded_loading_button/rounded_loading_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController cUsername = TextEditingController();
  TextEditingController cFullName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController cAlamat = TextEditingController();
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();
  
  
  List sex=["Laki-laki","Perempuan"];

  String nUsername, nFullName, nEmail, nPassword, nAlamat;
  String gender = "";

  //menambahkan key form
  final _keyForm = GlobalKey<FormState>();

  // show and hidden password
   bool _secureText = true;

  showHide() {
   setState(() {
     _secureText = !_secureText;
    });
  }

  void pilihSex(String value){
  setState(() {
  gender = value;
  });
  }
  // check data saat pressed sign up
    checkForm() async {
    Timer(Duration(seconds: 3), () {
        final form = _keyForm.currentState; 
    if (form.validate()){
      form.save();
      submitDataRegister();
      _btnController.success();
    }else {
      showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Gagal Registasi',style: TextStyle(fontSize: 20),),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );
      print('tidak terdaftar databases');
      _btnController.reset();
    }
    });
  }

  submitDataRegister() async{
    final responseData = await http.post("http://192.168.43.40/Php/registasi.php",
    body: {
      "username" : nUsername,
      "full_name": nFullName,
      "email"    : nEmail,
      "password" : nPassword,
      "gender"   : gender,
      "alamat"   : nAlamat,
    });

    final data = jsonDecode(responseData.body);

    int value = data['value'];
    String pesan = data['massage'];

    //check value 1 or 0
    if (value == 1) {
      setState(() {
          showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Berhasil Mendaftar',style: TextStyle(fontSize: 20),),
              content: Icon(Icons.check,color: Colors.green,size: 60,),
            );
          }
        );
        _btnController.success();
          Navigator.pop(context);
      });
    } else if (value == 2) {
       showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(pesan,style: TextStyle(fontSize: 20),),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );

        _btnController.reset();
    } else {
       showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text(pesan,style: TextStyle(fontSize: 20),),
              content: Icon(Icons.error,color: Colors.red,size: 60,),
            );
          }
        );

        _btnController.reset();
  }
}

Row addRadioButton(int btnValue, String title) {
    return Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    Radio(
      activeColor: kColorPink,
      value: sex[btnValue],
      groupValue: gender,
      onChanged: (value){
        setState(() {
          print(value);
          pilihSex(value);
        });
      },
    ),
    Text(title,style: kColorField,)
    ],
  );
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
               padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
               child: Text('Membuat Akun Baru',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 20,))),
               Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Username tidak boleh kosong !!';
                  }
                  return null;
                },
                controller: cUsername,
                onSaved: (value) => nUsername = cUsername.text,
                decoration: InputDecoration(
                hintText: 'Username',
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
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Fullnama tidak boleh kosong !!';
                  }
                  return null;
                },
                controller: cFullName,
                onSaved: (value) => nFullName = cFullName.text,
                decoration: InputDecoration(
                hintText: 'Fullname',
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
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email tidak boleh kosong !!';
                  }else if (!value.contains('@')){
                    return 'mohon menggunakan email yang valid';
                  }
                  return null;
                },
                controller: cEmail,
                onSaved: (value) => nEmail = cEmail.text,
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
            SizedBox(height: 10,),
               Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                obscureText: _secureText,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password tidak boleh kosong !!';
                  }else if (value.length < 6) {
                    return 'password  tidak boleh kurang dari 6 carakter';
                  }
                  return null;
                },
                controller: cPassword,
                onSaved: (value) => nPassword = cPassword.text,
                decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                   onPressed: showHide,
                   icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility),
                 ),
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
            SizedBox(height: 10,),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Alamat tidak boleh kosong !!';
                  }
                  return null;
                },
                controller: cAlamat,
                onSaved: (value) => nAlamat = cAlamat.text,
                decoration: InputDecoration(
                hintText: 'Alamat',
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
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
             child: Column(
              children: [
                Row(
                  children: [
                    Text('Gender',style: TextStyle(fontSize: 15,color: kColorGrey),),
                  ],
                ),
                Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    addRadioButton(0, 'Laki-laki'),
                    addRadioButton(1, 'Perempuan'),
                  ],
                ),
              ], 
             ) 
            ),
            SizedBox(height: 10,),
           RoundedLoadingButton(
                color: kColorPink,
                child: Text('Sign In',style: TextStyle(color: Colors.white),),
                controller: _btnController,
                onPressed: (){checkForm();},
              ),
            SizedBox(height: 60,),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('Sudah punya akun ? ',style: tButtonColor,),
                 InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('Sign In',style: tButtonDuo,), 
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