import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:profil_sekolah/models/modelFirebase.dart';
import 'package:profil_sekolah/page/detail.dart';
import 'package:profil_sekolah/page/form.dart';
import 'package:profil_sekolah/page/profilpage.dart';
import 'package:profil_sekolah/util/const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  DatabaseReference _schoolref;
  User user;
  List<SchoolModel> listSchool = [];

  StreamSubscription<Event> _onSchoolAddedSubscription;
  StreamSubscription<Event> _onSchoolChangedSubscription;
  // final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  // Future getUserLogin() async {
  //   user = auth.currentUser;
  // }

  @override
  void initState() {
    super.initState();
    // getUserLogin();
    _schoolref = _database.reference().child('schools');
    _onSchoolAddedSubscription = _schoolref.onChildAdded.listen(_onAddSchool);
    _onSchoolChangedSubscription =
        _schoolref.onChildChanged.listen(_onChangeSchool);
  }

  @override
  void dispose() {
    super.dispose();
    _onSchoolAddedSubscription.cancel();
    _onSchoolChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profil School",
          style: kAppBarText,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: cColorsBlue,
              ),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ProfilPage()));
              })
        ],
      ),
      body: Container(
        color: cColorsWhite,
        child: _viewWidgetSchool(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => FormPage(
                    ref: _schoolref,
                  )));
        },
        child: Icon(Icons.add),
        backgroundColor: cColorsBlue,
      ),
    );
  }

  Widget _viewWidgetSchool() {
    if (listSchool.length > 0) {
      return ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(color: Colors.black);
        },
        itemCount: listSchool.length,
        itemBuilder: (context, index) {
          SchoolModel school = listSchool[index];
          return Dismissible(
              key: Key(school.key),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) async {
                deleteSchool(school.key, index);
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DetailPage(
                                school: school,
                              )));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Card(
                    elevation: 10.0,
                    child: ListTile(
                      leading: IconButton(
                        icon: Icon(
                          Icons.update,
                          color: cColorsBlue,
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => FormPage(
                                        ref: _schoolref,
                                        school: school,
                                      )));
                        },
                      ),
                      title: Text(school.nameSchool),
                      subtitle: Text(school.description),
                    ),
                  ),
                ),
              ));
        },
      );
    }
  }

  void _onAddSchool(Event event) {
    setState(() {
      listSchool.add(SchoolModel.fromSnapshot(event.snapshot));
    });
  }

  void _onChangeSchool(Event event) {
    var entryOld = listSchool.singleWhere((school) {
      return school.key == event.snapshot.key;
    });
    setState(() {
      listSchool[listSchool.indexOf(entryOld)] =
          SchoolModel.fromSnapshot(event.snapshot);
    });
  }

  Future<void> deleteSchool(String key, int index) async {
    await _schoolref.child(key).remove();
    setState(() {
      listSchool.removeAt(index);
    });
  }
}
