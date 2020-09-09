import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notte_simple_app/Page/note_home.dart';

class EditNote extends StatefulWidget {
  EditNote({this.list, this.index});
  final List list;
  final int index;
  @override
  _EditNoteState createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController controllerJudul;
  TextEditingController controllerIsi;

  void EditNote() {
    var url = "http://192.168.1.4/flutter_notes/edit_data.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "judul": controllerJudul.text,
      "isi": controllerIsi.text,
    });
  }

  @override
  void initState() {
    controllerJudul =
        TextEditingController(text: widget.list[widget.index]['judul']);
    controllerIsi =
        TextEditingController(text: widget.list[widget.index]['isi']);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: controllerJudul,
              decoration: InputDecoration(
                  hintText: "masukkan judul", labelText: "judul"),
            ),
            TextField(
              controller: controllerIsi,
              decoration:
                  InputDecoration(hintText: "isi ", labelText: "isi catetan"),
            ),
            SizedBox(height: 200),
            RaisedButton.icon(
              onPressed: () {
                EditNote();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => HomeNotePage(),
                ));
              },
              icon: Icon(Icons.save),
              label: Text("edit"),
              color: Colors.blue[200],
            )
          ],
        ),
      ),
    );
  }
}