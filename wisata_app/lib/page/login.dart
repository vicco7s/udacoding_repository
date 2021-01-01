import 'package:flutter/material.dart';
import 'package:wisata_app/util/count.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 70),
              child: Image.asset("images/logo.jpg"),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0,0,0,20),
            //   child: Text("Silahkan Login",style: lText,),
            // ),

            RaisedButton(
                color: bColorBlue,
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/google.png",width: 70,height: 70,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
                      child: Text('Login Dengan Google \r',style: TextStyle(
                        fontSize: 20,
                        color: bColorWhite,
                      ),),
                    )
                  ],
                ),
              ),


          ],
        ),
      ),
    );
  }
}
