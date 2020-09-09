import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notte_simple_app/Page/note_home.dart';
import 'package:notte_simple_app/components/containerpaint.dart';
import 'package:notte_simple_app/constant/constant.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final maxLines = 5;
  TextEditingController judul = TextEditingController();
  TextEditingController isi = TextEditingController();

  
    void addData() async {
    http.post("http://192.168.43.40/backend_note/add_data.php", body: {
      "judul": judul.text,
      "isi": isi.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,color: kColorBlue,), 
            onPressed: () {Navigator.pop(context);}
          ),
        centerTitle: true,
        title: Text("Add Note",style: kColorText,),
      ),
      body: CustomPaint(
        painter: CurvePainter(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Column(
            children: [
            Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
              child: Card(
                elevation: 20,
                child: Container(
                margin: EdgeInsets.all(10),
                height: maxLines * 10.0,
                child: TextFormField(
                  controller: judul,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    hintText: "Judul ?",
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
            ),
          ),
            Container(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Card(
                elevation: 20,
                child: Container(
                margin: EdgeInsets.all(10),
                height: maxLines * 24.0,
                child: TextFormField(
                  controller: isi,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    hintText: "Isikan yang anda pikirkan ?",
                    fillColor: Colors.white,
                    filled: true,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40,),
        GestureDetector(
            onTap: () {
              setState(() {
                addData();
              });
              Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => HomeNotePage()),
               (route) => false);
            },
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            decoration: buttonGesture,
            child: Icon(Icons.note_add,size: 40,color: Colors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}