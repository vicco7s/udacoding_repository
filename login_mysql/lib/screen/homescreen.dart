import 'package:flutter/material.dart';
import 'package:login_mysql/components/containerpaint.dart';
import 'package:login_mysql/constant/constant.dart';


class HomeScreen extends StatefulWidget {
   final VoidCallback signOut;
   final String nama;
   HomeScreen ({this.signOut,this.nama});
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