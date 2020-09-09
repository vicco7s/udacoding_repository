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

class NoteHome extends StatefulWidget {
  List list;
  int index;
  NoteHome({this.list,this.index});
  @override
  _NoteHomeState createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> {

  void deleteNote() async {
    var url = "http://192.168.43.40/backend_note/delete_data.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }
 void notteDelete() async {
    showDialog(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Catetan mu akan Di hapus nih ?',style: TextStyle(fontSize: 20),),
              // content: Icon(Icons.error,color: Colors.red,size: 60,),
              actions: [
                FlatButton(
                  onPressed: (){
                    setState(() {
                      deleteNote();
                    });
                  },
                  child: Text("Hapus Aja deh ",style: alerTextH,)),
                FlatButton(
                  onPressed: () => Navigator.pop(context), 
                  child: Text('Eh Jangan deh',style: alerTextT,))
              ],
            );
          }
        );
  }
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
                          title: Text(widget.list[i]['judul'],style: kColorField,),
                          subtitle: Text(widget.list[i]['isi']),
                          trailing: IconButton(icon: iconNote, onPressed: () => notteDelete()),
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
