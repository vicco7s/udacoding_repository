import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profil_sekolah/components/textform.dart';
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
      await addSchool(
        nameSchool: _schoolName.text,
        description: _description.text,
        lat: _lat.text,
        long: _long.text,
      );
    } else {
      //update
      await updateSchool(school: widget.school);
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
                child: TextForms(
                  inputController: _schoolName,
                  bordersd:
                      BorderSide(color: cColorsBlue, style: BorderStyle.solid),
                  lText: 'Nama Sekolah',
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextForms(
                  inputController: _description,
                  typeinput: TextInputType.multiline,
                  miLine: 1,
                  mxLine: 6,
                  lText: 'Description',
                  bordersd:
                      BorderSide(color: cColorsBlue, style: BorderStyle.solid),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextForms(
                  typeinput: TextInputType.number,
                  inputController: _lat,
                  lText: 'lat',
                  bordersd:
                      BorderSide(color: cColorsBlue, style: BorderStyle.solid),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextForms(
                  typeinput: TextInputType.number,
                  inputController: _long,
                  lText: 'long',
                  bordersd:
                      BorderSide(color: cColorsBlue, style: BorderStyle.solid),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CupertinoButton(
                  color: cColorsBlue,
                  child:
                      widget.school == null ? Text('Create') : Text('Update'),
                  onPressed: () {
                    print('test');
                    createorupdate();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addSchool({
    String nameSchool,
    String description,
    String lat,
    String long,
  }) async {
    SchoolModel school = SchoolModel(
      nameSchool: nameSchool,
      description: description,
      lat: lat,
      long: long,
    );
    await widget.ref.push().set(school.toJson());
    Navigator.pop(context, 'create');
  }

  Future<void> updateSchool({SchoolModel school}) async {
    school.nameSchool = _schoolName.text;
    school.description = _description.text;
    school.lat = _lat.text;
    school.long = _long.text;

    await widget.ref.child(school.key).set(school.toJson());
    Navigator.pop(context,'update');
  }
}
