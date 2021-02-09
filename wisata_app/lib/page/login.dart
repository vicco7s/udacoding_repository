import 'package:flutter/material.dart';
import 'package:wisata_app/Splash/Splash2.dart';
import 'package:wisata_app/components/buttonLogin.dart';
import 'package:wisata_app/page/homepage.dart';
import 'package:wisata_app/services/firebaselogin.dart';
import 'package:wisata_app/services/sharedlogin.dart';
import 'package:wisata_app/util/count.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = false;
  FirebaseLoginService _firebaseLoginService = FirebaseLoginService();
  SharedPrefService _sharedPrefService = SharedPrefService();

  Future<void> checkLogin() async{
    final result = await _sharedPrefService.isLogin();
    setState(() {
      isLogin = result;
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return isLogin ? HomePage() :
    Scaffold(
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
                _firebaseLoginService.handleSignIn().then((result) {
                    if(result != null) {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) => HomePage(),
                      ));
                    }
                });
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


