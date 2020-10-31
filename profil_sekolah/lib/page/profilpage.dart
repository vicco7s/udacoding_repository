import 'package:flutter/material.dart';
import 'package:profil_sekolah/models/firebaselogin.dart';
import 'package:profil_sekolah/screen/splashlogout.dart';
import 'package:profil_sekolah/util/const.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: cColorsBlue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Profil', style: kAppBarText),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: kStyleTextprof,
              ),
              Text(
                name,
                style: kTextProf,
              ),
              SizedBox(height: 20),
              Text('EMAIL', style: kStyleTextprof),
              Text(
                email,
                style: kTextProf,
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  signOutGoogle(); //import firebasilogin
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return SplashOut();
                  }), ModalRoute.withName('/'));
                },
                color: cColorsBlue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
