import 'package:flutter/material.dart';
import 'package:profil_sekolah/page/profilpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profil School"),
        leading: IconButton(icon: Icon(Icons.exit_to_app),onPressed: () => ProfilPage(),),
      ),
      body: Container(),
    );
  }
}
