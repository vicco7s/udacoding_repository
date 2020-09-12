import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final List list;
  final int index;
  DetailPage({this.list,this.index});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       centerTitle: true,
       title: Text(widget.list[widget.index]['kategori'],), 
      ),
      body: Container(
       child: Column(
         children: [
          Image.network('http://192.168.43.40/backend_note/' + widget.list[widget.index]['image'],fit: BoxFit.fill,width: 500,height: 300,),
          SizedBox(height: 20,),
          Card(
            elevation: 20,
           child: Container(
             padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
            child: Row(
             children: [
               Text('Harga : ',style: TextStyle(fontSize: 30),),
               Text(widget.list[widget.index]['harga'],style: TextStyle(fontSize: 30),)
             ], 
            ), 
           ), 
          )
         ],
       ) 
      ),
    );
  }
}