import 'package:flutter/material.dart';
import 'package:mahasiswa_app/constant/cons.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Mahasiswa',style: alerTextT,),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context,i) {
          return Container(
            child: Text('testing'),
          );
        }
      ),
    );    
  }
}