import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notte_simple_app/Page/note_home.dart';
import 'package:http/http.dart' as http;
import 'package:notte_simple_app/components/containerpaint.dart';
import 'package:notte_simple_app/constant/constant.dart';

// ignore: must_be_immutable
class DetailNote extends StatefulWidget {
  List list;
  int index;
  DetailNote({this.index, this.list});
  @override
  _DetailNoteState createState() => _DetailNoteState();
}

class _DetailNoteState extends State<DetailNote> {

  TextEditingController judul;
  TextEditingController isi;

  final maxLines = 5;

  void deleteNote() async {
    var url = "http://192.168.43.40/backend_note/delete_data.php";
    http.post(url, body: {
       "id": widget.list[widget.index]['id'],
      });
  }
 void notteDelete() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Catetan mu akan Di hapus nih ?',style: TextStyle(fontSize: 20),),
          actions: [
            FlatButton(
              onPressed: (){
                setState(() {
                  deleteNote();
                });
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeNotePage()), (route) => false);
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

  void updateNote() async {
    var url = "http://192.168.43.40/backend_note/edit_data.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "judul": judul.text,
      "isi": isi.text,
    });
  }

  void notteUpdate() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Yakin sudah kamu perbarui catatan mu ?',style: TextStyle(fontSize: 20),),
          actions: [
            FlatButton(
              onPressed: (){
                setState(() {
                  updateNote();
                });
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomeNotePage()), (route) => false);
              },
              child: Text("Sudah kok !",style: alerTextH,)),
            FlatButton(
              onPressed: () => Navigator.pop(context), 
              child: Text('Cek lagi deh',style: alerTextT,))
          ],
        );
      }
    );
  }

  @override
  void initState() {
    judul = TextEditingController(text: widget.list[widget.index]['judul']);
    isi = TextEditingController(text: widget.list[widget.index]['isi']);
    super.initState();
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
        title: Text("Catatan Anda",style: kColorText,),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    notteDelete();
                  });
                },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: buttonGestures,
                child: Icon(Icons.delete,size: 40,color: kColorPink,),
                  ),
                ),
                GestureDetector(
                onTap: () {
                  setState(() {
                    notteUpdate();
                  });
                },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: buttonGestures,
                child: Icon(Icons.save,size: 40,color: kColorBlue,),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
