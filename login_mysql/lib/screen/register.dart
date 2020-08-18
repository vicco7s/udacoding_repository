import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
    List gender=["Male","Female"];

  String sex;

Row addRadioButton(int btnValue, String title) {
    return Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
    Radio(
      activeColor: kColorPink,
      value: gender[btnValue],
      groupValue: sex,
      onChanged: (value){
        setState(() {
          print(value);
          sex=value;
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
      body: Container(
        child: CustomPaint(
         painter: CurvePainter(),
         child: Container(
        alignment: Alignment.bottomCenter,
         child: SingleChildScrollView(
          child: Column(
           children: [
             Container(
               padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
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
                //  controller: usernameController,
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
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Fullnama tidak boleh kosong !!';
                  }
                  return null;
                },
                //  controller: usernameController,
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
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email tidak boleh kosong !!';
                  }
                  return null;
                },
                //  controller: usernameController,
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
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password tidak boleh kosong !!';
                  }
                  return null;
                },
                //  controller: usernameController,
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
            SizedBox(height: 20,),
            Container(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Alamat tidak boleh kosong !!';
                  }
                  return null;
                },
                //  controller: usernameController,
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
            SizedBox(height: 20,),
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
                    addRadioButton(0, 'Male'),
                    addRadioButton(1, 'Female'),
                  ],
                ),
              ], 
             ) 
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
                child: Text('Sign Up',style: tColorButton,),
              ), 
             ), 
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