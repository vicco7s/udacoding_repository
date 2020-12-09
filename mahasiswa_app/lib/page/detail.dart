
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
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text(mahasiswa.nim),
                ),
              ),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text(mahasiswa.nama),
                ),
              ),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text(mahasiswa.gender),
                ),
              ),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text(mahasiswa.alamat),
                ),
              ),
              Card(
                elevation: 10,
                child: ListTile(
                  title: Text(mahasiswa.tahun.toString()),
                ),
              ),
              
            ],
          ),
        ),
    );
  }
}