import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profil_sekolah/page/profilpage.dart';
import 'package:profil_sekolah/util/const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Profil School",style: kAppBarText,),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_outlined,color: cColorsBlue,),
            onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context) => ProfilPage()));
            })
        ],
      ),
      body: Container(),
    );
  }
}
