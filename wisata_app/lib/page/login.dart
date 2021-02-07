import 'package:flutter/material.dart';
import 'package:wisata_app/components/buttonLogin.dart';
import 'package:wisata_app/util/count.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 70),
              child: Image.asset("images/logo.jpg"),
            ),

            ButtonLogin(
              onTap: (){
                print("button click");
              },
              img: Image.asset("images/google.png",width: 70,height: 70),
              tButton: Text("Login With Google \r",style: lTextduo,),
            ),
          ],
        ),
      ),
    );
  }
}


