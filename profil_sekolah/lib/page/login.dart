import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:profil_sekolah/components/ButtonLogin.dart';
import 'package:profil_sekolah/models/firebaselogin.dart';
import 'package:profil_sekolah/page/homepage.dart';
import 'package:profil_sekolah/util/const.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: <String>['email', 'profil']);
  String photoUrl = "please link here";

  String name = "", email = "", profilePic = "", gender = "";

  FToast ftoast;

  @override
  void initState() {
    // TODO: implement initState
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
              Card(
                elevation: 20,
                child: Container(
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
                          _googleSignIn.signIn().then((response) {
                            setState(() {
                              name = response.displayName;
                              email = response.email;
                              photoUrl = response.photoUrl;
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => HomePage()));
                            });
                          }).catchError((onError) => print(onError));
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
              )
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
