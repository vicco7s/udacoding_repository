import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:profil_sekolah/page/profilpage.dart';
import 'package:profil_sekolah/util/const.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final items = List<String>.generate(20, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Profil School",
          style: kAppBarText,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.account_circle_outlined,
                color: cColorsBlue,
              ),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => ProfilPage()));
              })
        ],
      ),
      body: Container(
        color: cColorsWhite,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, i) {
              return Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Card(
                    elevation: 10.0,
                    child: ListTile(
                      onTap: () => print('detail'),
                      leading: IconButton(
                        icon: Icon(Icons.update,color: cColorsBlue,),
                        onPressed: () {
                          print('update');
                        },
                      ),
                      title: Text('SMAN 1 SALAM BABARIS',),
                      subtitle: Text('jl,transmigrasi Utara Kel.Salam Babaris Kab.Tapin'),
                    ),
                  ),
                );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('create'),
        child: Icon(Icons.add),
        backgroundColor: cColorsBlue,
      ),
    );
  }
}
