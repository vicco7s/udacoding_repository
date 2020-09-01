import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> asset = ['a','b','c','d'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
            SliverAppBar(
              pinned: true,
              title: Text('Gallery',style: TextStyle(color: Colors.black),),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
          ];
        },
        
        body: GridView.count(crossAxisCount: 2, children: List.generate(asset.length, (index) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Card(
              elevation: 20,
              child: Container(
                child: Text(asset[index]),
              ),
            ),
          );
        }),)
      )
    );
  }
}