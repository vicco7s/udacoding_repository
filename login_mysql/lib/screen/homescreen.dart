import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
   final VoidCallback signOut;
   HomeScreen ({this.signOut});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  signOut() {
   setState(() {
     widget.signOut();
   });
 }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
       painter: CurvePainter(),
       child: Center(
         child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Card(
                    elevation: 15.0,
                    color: Colors.white,
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                           leading: Text('Nama :'), 
                           title: Text('---'),
                          ),
                          ListTile(
                           leading: Text('Email :'), 
                           title: Text('---'),
                          ),
                          ListTile(
                           leading: Text('Gender :'), 
                           title: Text('---'),
                          ),
                          ListTile(
                           leading: Text('Alamat :'), 
                           title: Text('---'),
                          ),
                          ListTile(
                           leading: Text('Tanggal Daftar :'), 
                           title: Text('---'),
                          )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
              child: GestureDetector(
              onTap: (){
                setState(() {
                  signOut();
                });
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                decoration: BoxDecoration(
                  color: kColorPink,
                 borderRadius: BorderRadius.circular(50) 
                ), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('Log Out',style: tColorButton,),
                 ], 
                )
              ), 
             ), 
            ),
             ], 
            ),
         ),
       ), 
      ),
    );
  }
}