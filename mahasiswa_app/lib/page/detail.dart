
import 'package:flutter/material.dart';
import 'package:mahasiswa_app/constant/cons.dart';
import 'package:mahasiswa_app/model/mahasiswaModel.dart';

class PageDetail extends StatelessWidget {
  final ModelMahasiswa mahasiswa;

   PageDetail({this.mahasiswa});
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
        title: Text("Profil",style: alerTextT,),
        centerTitle: true,  
      ),
      body: Center(
        child: Card(
          elevation: 20.0,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text('Nama : '+ mahasiswa.nim),
              ),
              ListTile(
                title: Text('Nim  : '+ mahasiswa.nama),
              ),
              ListTile(
                title: Text('alamat : '+ mahasiswa.gender),
              ),
              ListTile(
                title: Text('gender : '+ mahasiswa.alamat),
              ),
              ListTile(
                title: Text('angkatan : '+ mahasiswa.tahun.toString()),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}