import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class HomeScreen extends StatefulWidget {
   final VoidCallback signOut;
   final String nama;
   HomeScreen ({this.signOut,this.nama});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
        _btnController.reset();
        setState(() {
          signOut();
        });
    });
}
 

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
         child: Container(
           alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
                  child: Card(
                    elevation: 15.0,
                    child: ListTile(
                      title: Center(
                        child: Text("Selamat datang di halaman Dashboard")
                      ), 
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Card(
                    elevation: 15.0,
                    color: Colors.white,
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center ,
                           children: [
                             Container(
                               padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                               child: Image.asset(
                                 'images/logo.png',width: 50,height: 50,color: kColorBlue,)),
                           ], 
                          ),
                          SizedBox(height: 20,),
                          Text(
                            'hello'+' '+widget.nama+' !',
                            style: TextStyle(fontSize: 30,color: kColorGrey,fontWeight: FontWeight.bold),
                            ),
                          SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              RoundedLoadingButton(
                color: kColorPink,
                child: Text('Log Out',style: TextStyle(color: Colors.white),),
                controller: _btnController,
                onPressed: (){_doSomething();},
              ),
              
             ], 
            ),
         ),
      ),
    );
  }
}