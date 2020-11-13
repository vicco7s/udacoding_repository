import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:profil_sekolah/models/modelFirebase.dart';

class FormPage extends StatefulWidget {
  final SchoolModel school;
  final DatabaseReference ref;
  FormPage({this.school,this.ref});
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
