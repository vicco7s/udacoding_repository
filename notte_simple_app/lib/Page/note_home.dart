import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeNotePage extends StatefulWidget {
  @override
  _HomeNotePageState createState() => _HomeNotePageState();
}

class _HomeNotePageState extends State<HomeNotePage> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.1.4/flutter_notes/data_notes_awal.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Catetan Bu Tejo")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => TambahData())),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? DataNotes(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class DataNotes extends StatelessWidget {
  final List list;
  DataNotes({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DetailPage(
                      list: list,
                      index: i,
                    ))),
            child: Container(
              child: Card(
                child: ListTile(
                  title: Text(list[i]['judul']),
                  leading: Icon(
                    Icons.book,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatefulWidget {
  List list;
  int index;
  DetailPage({this.index, this.list});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void deleteData() {
    var url = "http://192.168.1.4/flutter_notes/hapus_data.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void hapusData() {
    AlertDialog alertDialog = new AlertDialog(
      content: Text(
          "arep ngapus catetan iki ${widget.list[widget.index]['judul']} ??"),
      actions: [
        RaisedButton(
            color: Colors.blue[200],
            child: Text("hapus wae"),
            onPressed: () {
              deleteData();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => HomeNotePage(),
              ));
            }),
        RaisedButton(
          color: Colors.blue[200],
          child: Text("ojo dihapus"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

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
                    onPressed: () => hapusData(),
                    icon: Icon(Icons.restore_from_trash),
                    label: Text("hapus")),
                RaisedButton.icon(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => EditData(
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

class TambahData extends StatefulWidget {
  @override
  _TambahDataState createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  TextEditingController controllerJudul = TextEditingController();
  TextEditingController controllerIsi = TextEditingController();

  void addData() {
    var url = "http://192.168.1.4/flutter_notes/tambah_data.php";
    http.post(url, body: {
      "judul": controllerJudul.text,
      "isi": controllerIsi.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("halaman data"),
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
                addData();
                Navigator.pop(context);
              },
              icon: Icon(Icons.save),
              label: Text("save"),
              color: Colors.blue[200],
            )
          ],
        ),
      ),
    );
  }
}

class EditData extends StatefulWidget {
  EditData({this.list, this.index});
  final List list;
  final int index;
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerJudul;
  TextEditingController controllerIsi;

  void editData() {
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
                editData();
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