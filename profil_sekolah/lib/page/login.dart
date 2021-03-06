import 'package:flutter/material.dart';
import 'package:profil_sekolah/components/ButtonLogin.dart';
import 'package:profil_sekolah/models/firebaselogin.dart';
import 'package:profil_sekolah/screen/splashLogin.dart';
import 'package:profil_sekolah/util/const.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FToast ftoast;

  @override
  void initState() {
    super.initState();
    ftoast = FToast();
    ftoast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Image.asset(
                  'images/logo.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Text(
                'Welcome in the school !!',
                style: kStyleText,
              ),
              Text(
                'Selamat Datang',
                style: kStyleText,
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
                        child: Text(
                          'Silahkan untuk Login',
                          style: kStyleText3,
                        ),
                      ),
                      ButtonLogin(
                        onPress: () {
                          signInWithGoogle().then((result) {
                            if (result != null) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => SplashLogin()));
                            } 
                          });
                        },
                        paddings: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                        texts: Text(
                          'Sign in with Google',
                          style: kStyleText2,
                        ),
                        images: AssetImage("images/logo-google.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        onPress: () {
                          _showToast();
                        },
                        paddings: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                        texts: Text(
                          'Sign in with Twitter',
                          style: kStyleText2,
                        ),
                        images: AssetImage("images/twitter.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonLogin(
                        onPress: () {
                          _showToast();
                        },
                        paddings: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        texts: Text(
                          'Sign in with Facebook',
                          style: kStyleText2,
                        ),
                        images: AssetImage("images/facebook.png"),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _showToast() {
    Widget toast = Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.sentiment_very_dissatisfied,
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Maaf Layanan Login Ini Belum Tersedia",
            style: kStyleToast,
          ),
        ],
      ),
    );
    ftoast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: Duration(seconds: 3),
    );
  }
}
