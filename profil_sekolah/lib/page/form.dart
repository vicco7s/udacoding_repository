import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profil_sekolah/models/modelFirebase.dart';
import 'package:profil_sekolah/util/const.dart';

class FormPage extends StatefulWidget {
  final SchoolModel school;
  final DatabaseReference ref;
  FormPage({this.school, this.ref});
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController _schoolName = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _lat = TextEditingController();
  TextEditingController _long = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.school != null) {
      _schoolName = TextEditingController(text: widget.school.nameSchool);
      _description = TextEditingController(text: widget.school.description);
      _lat = TextEditingController(text: widget.school.lat);
      _long = TextEditingController(text: widget.school.long);
    }
  }

  Future<void> createorupdate() async {
    if (widget.school == null) {
      //make
      // await addSchool(
      //   nameSchool: _schoolName.text,
      //   description: _description.text,
      //   lat: _lat.text,
      //   long: _long.text,
      // );
    } else {
      //update
      // await updateSchool(
      //   school: widget.school
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: cColorsWhite,
        title: Text(
          "Isi Profil Sekolah",
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
        color: cColorsWhite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _schoolName,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: cColorsBlue,
                        style: BorderStyle.solid
                      ),
                    ),
                    labelText: 'Nama Sekolah',
                    labelStyle: TextStyle(
                      color:cColorsBlue
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _description,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: cColorsBlue,
                        style: BorderStyle.solid
                      ),
                    ),
                    labelText: 'Deskripsi',
                    labelStyle: TextStyle(
                      color:cColorsBlue
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _lat,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: cColorsBlue,
                        style: BorderStyle.solid
                      ),
                    ),
                    labelText: 'lat',
                    labelStyle: TextStyle(
                      color:cColorsBlue
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _long,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: cColorsBlue,
                        style: BorderStyle.solid
                      ),
                    ),
                    labelText: 'long',
                    labelStyle: TextStyle(
                      color:cColorsBlue
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              CupertinoButton(
                color: cColorsBlue,
                child: widget.school == null ? Text('Create') : Text('Update'), 
                onPressed: (){
                  print('creat');
                }),
            ],
          ),
        ),
      ),
    );
  }
}
