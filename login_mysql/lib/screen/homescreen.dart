import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../model/network.dart';

class HomeScreen extends StatefulWidget {
   final VoidCallback signOut;
   final String nama;
   HomeScreen ({this.signOut,this.nama});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Welcome> listModel = [];
  var loading = false;
  Future<Null> getData() async {
  setState(() {
  loading = true;
  });
    final responseData =
      await http.get("http://192.168.43.40:8000/Php/result.php");
      if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
    setState(() {
      for (Map i in data) {
      listModel.add(Welcome.fromJson(i));
      }
      loading = false;
    });
  }
}
  @override
  void initState() {
  super.initState();
  getData();
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
            child: loading ? CircularProgressIndicator() :Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 150, 20, 0),
                  child: Card(
                    elevation: 15.0,
                    child: ListTile(
                      title: Center(
                        child: Text("Tentang Pengguna")
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
                           title: Container(
                            child: Row(
                            children: [
                                Expanded(child: Text('----'))
                              ], 
                             ),
                           )
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
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.fromLTRB(100, 0, 100, 0),
              child: GestureDetector(
              onTap: (){
                setState(() {
                  signOut();
                });
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                  color: kColorPink,
                 borderRadius: BorderRadius.circular(50) 
                ), 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.exit_to_app,color: Colors.white,),
                   SizedBox(width: 15,),
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
    );
  }
}