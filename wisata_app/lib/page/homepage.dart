import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wisata_app/services/firebaselogin.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User currentUser;

  FirebaseLoginService firebaseLoginService = FirebaseLoginService();

  void getUser() async{
    currentUser = await firebaseLoginService.getUserCurrent();
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisata Kalsel"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.account_circle), onPressed: (){
            
          })
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Text("Home Page"),
      ),
    );
  }
}
