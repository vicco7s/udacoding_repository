import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
  
  List sex=["Male","Female"];

  String nUsername, nFullName, nEmail, nPassword, nAlamat;
  String gender = "";

  //menambahkan key form
  final _keyForm = GlobalKey<FormState>();
  // check data saat pressed sign up
    checkForm(){
      final form = _keyForm.currentState;
      if(form.validate()){
      form.save();
      submitDataRegister();
  }
}

  submitDataRegister() async{
    final responseData = await http.post("http://10.0.2.2:8080/Php/registasi.php",
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
        Navigator.pop(context);
      });
    } else if (value == 2) {
      print(pesan);
    } else {
      print(pesan);
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
          gender=value;
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
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password tidak boleh kosong !!';
                  }
                  return null;
                },
                controller: cPassword,
                onSaved: (value) => nPassword = cPassword.text,
                decoration: InputDecoration(
                hintText: 'Password',
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
                    addRadioButton(0, 'Cowok'),
                    addRadioButton(1, 'Cewek'),
                  ],
                ),
              ], 
             ) 
            ),
            SizedBox(height: 10,),
            Center(
             child: GestureDetector(
              onTap: (){
                setState(() {
                  checkForm();
                });
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(117, 20, 117, 20),
                decoration: BoxDecoration(
                  color: kColorPink,
                 borderRadius: BorderRadius.circular(50) 
                ), 
                child: Text('Sign Up',style: tColorButton,),
              ), 
             ), 
            ),
            SizedBox(height: 100,),
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