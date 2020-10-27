import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: 150,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Text('Sign Out'),
        textColor: Colors.black,
        color: Colors.white,
        onPressed: () {
          // _googleSignIn
          //     .signOut()
          //     .then((value) => print("Out"))
          //     .catchError((onError) => print(onError));

          // setState(() {
            
          // });
        },
      ),
      ),
    );
  }
}
