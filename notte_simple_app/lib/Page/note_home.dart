import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:notte_simple_app/components/containerpaint.dart';
import 'dart:convert';

import 'package:notte_simple_app/constant/constant.dart';
import 'package:notte_simple_app/screen/add_note.dart';
import 'package:notte_simple_app/screen/detail_note.dart';

class HomeNotePage extends StatefulWidget {
  final VoidCallback signOut;
  HomeNotePage({this.signOut});
  @override
  _HomeNotePageState createState() => _HomeNotePageState();
}

class _HomeNotePageState extends State<HomeNotePage> {
  Future<List> getData() async {
    final response = await http.get("http://192.168.43.40/backend_note/home_note.php");
    return json.decode(response.body);
  }

   signOut() {
   setState(() {
     widget.signOut();
   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Notte App',style: kColorText,),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app,color: kColorBlue,), 
            onPressed: (){
              signOut();
            }
          )
        ],
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? NoteHome(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class NoteHome extends StatefulWidget {
  List list;
  // int index;
  NoteHome({this.list});
  @override
  _NoteHomeState createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {

  
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(),
      child: Column(
          children: [
           Expanded(
             child: ListView.builder(
                itemCount: widget.list == null ? 0 : widget.list.length,
                itemBuilder: (context, i) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => DetailNote(
                              list: widget.list,
                              index: i,
                            ))),
                    child: Container(
                      child: Card(
                        elevation: 20.0,
                        child: ListTile(
                          title: Text(widget.list[i]['judul'],style: kColorNote,),
                          subtitle: Text(widget.list[i]['isi']),
                          trailing: iconNote,
                          ),
                        ),
                      ),
                    ),
                  );
                 },
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => AddNote()));
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    decoration: buttonGestures,
                    child: Icon(Icons.add,size: 40,color: kColorBlue,),
                  ),
                ),
              ),
          ], 
         ),
    );
  }
}
