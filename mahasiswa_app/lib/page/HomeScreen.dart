import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mahasiswa_app/constant/cons.dart';
import 'package:mahasiswa_app/helper/mahasiswaHelper.dart';
import 'package:mahasiswa_app/model/loginmodel.dart';
import 'package:mahasiswa_app/model/mahasiswaModel.dart';
import 'package:mahasiswa_app/page/detail.dart';
import 'package:mahasiswa_app/page/form.dart';
import 'package:mahasiswa_app/page/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedPreferences sp;
  LoginUser userData;

  List<ModelMahasiswa> items = List();
  DataMahasiswaHap db = DataMahasiswaHap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    db.getAllMahasiswa().then((value) {
      setState(() {
        value.forEach((element) {
        items.add(ModelMahasiswa.fromMap(element));
      });
    });
  });
  getUserData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Mahasiswa',style: alerTextT,),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app_sharp,color:kColorBlue), 
            onPressed: () => logout(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kColorBlue,
        onPressed: () {
          _navigateToAdd();
      }),
      body:ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,i) {
          return Container(
            child: Card(
              elevation: 20.0,
             child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context) => PageDetail(
                    mahasiswa: items[i],
                  )));
                },
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.update,color: kColorBlue,), 
                  onPressed: (){
                    _navigateUpdate({
                      "id": items[i].id,
                      "nama": items[i].nama,
                      "nim": items[i].nim,
                      "alamat": items[i].alamat,
                      "gender": items[i].gender,
                      "tahun": items[i].tahun,
                    });
                  }
                ),
                title: Text('${items[i].nim}',style: kColorText,),
                subtitle: Text('${items[i].nama}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete), 
                  onPressed: () {
                    AlertDialog hapus = AlertDialog(
                        title: Text('Information'),
                          content: Container(
                            height: 100.0,
                          child: Column(
                            children: <Widget>[
                              Text('Apakah anda yakin ingin hapus data${items[i].nama}')
                            ],
                          ),
                        ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('yes'),
                      onPressed: () {
                      db.deleteMahasiswa(items[i].id).then((value){
                          setState(() {
                            items.clear();
                            _getMahasiswa();
                            print('Delete success');
                          });
                        });
                      Navigator.pop(context);
                      },
                  ),
                  FlatButton(
                    child: Text('no'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
                showDialog(context: context, child: hapus);
              },),
            )
          ),
        ),
       );
       }
      )
      
    );
  }

  Future<void> _navigateToAdd() async {
    var result = await Navigator.push(context, CupertinoPageRoute(builder: (context) => FormMahasiswa(),));
    if(result=='refresh'){
      _getMahasiswa();
    }
  }

  Future<void> _navigateUpdate(Map<String, dynamic> data) async {
    var result = await Navigator.push(context, CupertinoPageRoute(builder: (context) => FormMahasiswa(data: data,),));
    if(result=='refresh'){
      _getMahasiswa();
    }
  }

  _getMahasiswa(){
    db.getAllMahasiswa().then((value){
      setState(() {
        items.clear();
        value.forEach((element) {
          items.add(ModelMahasiswa.fromMap(element));
        });
      });
    });
  }

  getUserData() async {
    sp = await SharedPreferences.getInstance();
    userData = LoginUser.fromMap(jsonDecode(sp.getString('userData')));
  }

  logout() async{
    sp = await SharedPreferences.getInstance();
    sp.clear();
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginPage(),), (route) => false);
  }

  
}
     