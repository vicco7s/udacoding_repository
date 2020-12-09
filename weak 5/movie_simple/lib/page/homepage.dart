import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_simple/constant/constant.dart';
import 'package:movie_simple/page/Detail.dart';
import 'package:movie_simple/service/Network.dart';

class HomePage extends StatefulWidget {
  final VoidCallback signOut;
  HomePage({this.signOut});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _sk = GlobalKey<ScaffoldState>();
  bool isloading = true;
  List<TbMovie> listmovie = [];

 
  Future<List> getData() async {
    final response = await http.get(url);
    // return json.decode(response.body);
    Map<String, dynamic> map = json.decode(response.body);
    List<dynamic> data = map["tb_movie"];
    print(data[0]["title"]);
    return data;
  }

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sk,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kColorBlue),
       centerTitle: true,
       title: Text('Movie',style: kColorText,), 
       actions: [
         IconButton(icon: Icon(Icons.exit_to_app), onPressed: () => signOut()),
       ],
      ),
      body: SafeArea(
          child: FutureBuilder<List>(
            future: getData(),
            builder: (context,snapshot) {
              if (snapshot.hasError) print(snapshot.hasError);
              return snapshot.hasData ? Listmovie(list: snapshot.data,): Center(child: CircularProgressIndicator());
            }),
      )
    );
  }
}

class Listmovie extends StatelessWidget {
  final List list;
  Listmovie({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
               padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
               child: GestureDetector(
                 onTap: () {
                   Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailMovie(
                     list: list,
                     i: i,
                   )));
                 },
                 child: Card(
                   elevation: 15.0,
                   child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Image.network(list[i]['foto'],fit: BoxFit.cover, width: 100,height: 100,),
                      //  SizedBox(width: 20,),
                       Container(
                         padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                         child: Column(
                          children: [
                             Text(list[i]['title'],style: kColorText,),
                             SizedBox(height: 20,),
                             Text('Genre : '+ list[i]['genre'][0] +' '+list[i]['genre'][1],style: kColorP),
                             SizedBox(height: 20,),
                             
                          ], 
                         ),
                       ),
                       Container( margin: EdgeInsets.fromLTRB(0, 0, 20,0),
                         child: Text(list[i]['rating'],style: kColorText,),)
                     ], 
                    ), 
                   ),
                 ),
               ),
            
        );
    });
  }
}