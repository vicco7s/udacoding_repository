import 'dart:convert';

import 'package:e_comers_simple/constant/constant.dart';
import 'package:e_comers_simple/page/detailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
   final VoidCallback signOut;
  HomePage({@required this.signOut});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.43.40/backend_note/commers.php");
    return json.decode(response.body);
  }

  signOut() {
   setState(() {
     widget.signOut();
   });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
       title: Text('Toko Online',style: kColorText,), 
        actions: [
         IconButton(icon: Icon(Icons.exit_to_app,color: kColorBlue,), onPressed: ()=> signOut()) 
       ],
      ),
      body:  FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? EcommersPage(list: snapshot.data)
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class EcommersPage extends StatefulWidget {
  final List list; 
  EcommersPage({this.list});
  @override
  _EcommersPageState createState() => _EcommersPageState();
}

class _EcommersPageState extends State<EcommersPage> with SingleTickerProviderStateMixin {

  TabController controller;
   @override
  void initState() {
    super.initState();

    controller = TabController(vsync: this, length: widget.list.length);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            pinned: false,
            bottom: TabBar(
            indicatorColor: kColorBlue,
            controller: controller,
            isScrollable: true,
            tabs: List<Widget>.generate(widget.list.length, (index) => Container(
              child: Tab(
                child: Text(widget.list[index]['kategori']),
              ),
          ))), 

          )
        ];
      }, body: TabBarView(
        controller: controller,
        children: List<Widget>.generate(widget.list.length, (index) => 
          ListView(
           children: [
             SizedBox(height: 20,),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk1']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk2']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk3']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk4']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk5']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk6']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk7']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk8']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk9']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),
             GestureDetector(
               onTap: () {
                 Navigator.push(context, CupertinoPageRoute(builder: (context) => DetailPage(list: widget.list, index: index,)));
               },
               child: Container(
                 padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                 child: Card(
                   elevation: 20,
                   child: ListTile(
                      leading: Text(widget.list[index]['produk10']), 
                      trailing: Icon(Icons.shopping_cart),
                   )
                 ),
               ),
             ),

           ], 
          )
        )
      ),)
    );
  }
}
