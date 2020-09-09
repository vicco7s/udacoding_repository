import 'package:flutter/material.dart';
import 'package:notte_simple_app/Page/note_home.dart';
import 'package:http/http.dart' as http;
import 'package:notte_simple_app/screen/edit_note.dart';

class DetailNote extends StatefulWidget {
  List list;
  int index;
  DetailNote({this.index, this.list});
  @override
  _DetailNoteState createState() => _DetailNoteState();
}

class _DetailNoteState extends State<DetailNote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text("${widget.list[widget.index]['judul']}")),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              widget.list[widget.index]['judul'],
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            ),
            SizedBox(height: 30),
            Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                color: Colors.blueGrey[200],
                child: Center(
                  child: Text(
                    widget.list[widget.index]['isi'],
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton.icon(
                    color: Colors.blue[200],
                    onPressed: () {},
                    icon: Icon(Icons.restore_from_trash),
                    label: Text("hapus")),
                RaisedButton.icon(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EditNote(
                      list: widget.list,
                      index: widget.index,
                    ),
                  )),
                  icon: Icon(Icons.edit),
                  label: Text("edit"),
                  color: Colors.blue[200],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
