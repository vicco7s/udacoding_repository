import 'package:flutter/material.dart';
import 'package:profil_sekolah/models/modelFirebase.dart';

class DetailPage extends StatefulWidget {
  final SchoolModel school;
  DetailPage({this.school});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(),
    );
  }
}
