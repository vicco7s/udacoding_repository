import 'package:flutter/material.dart';
import 'package:profil_sekolah/models/modelFirebase.dart';
import 'package:profil_sekolah/util/const.dart';

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
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: cColorsWhite,
        title: Text(
          "${widget.school.nameSchool}",
          style: kAppBarText,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: cColorsBlue,
          ),
          onPressed: () {
            Navigator.of(context).pop(context);
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            SchoolMap(),
          ], 
        ),
      ),
    );
  }
}
