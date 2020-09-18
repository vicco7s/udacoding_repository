import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red[600]),
        centerTitle: true,
       title: Text('Tube Mate',style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold),), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Card(
             elevation: 20.0,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
              child: Column(
               children: [
                 Text('WelCome To Tube Mate',style: TextStyle(fontSize: 20,color: Colors.red[600]),),
                 Icon(Icons.personal_video,size: 100,color: Colors.red[600],)
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

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20.0)),
            ListTile(
              leading: Icon(Icons.home,color: Colors.red[600],),
              title: Text('Home',style: TextStyle(fontSize: 18.0),),
              onTap: () => Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => HomePage())),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.playlist_play,color: Colors.red[600],),
              title: Text('PlayList',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                Navigator.of(context).push( CupertinoPageRoute(
                  builder: (BuildContext context) =>  ListVideo(
                    url: "https://fluttervlist.herokuapp.com/",
                    title: "Tube Playlist",
                  )));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.video_library,color: Colors.red[600],),
              title: Text('Code',style: TextStyle(fontSize: 18.0),),
              onTap: (){
                 Navigator.of(context).push( CupertinoPageRoute(
                  builder: (BuildContext context) =>  ListVideo(
                    url: "https://cookinglist.herokuapp.com/",
                    title: "Code",
                  )));
              },
            ),
            Divider(),
            SizedBox(height: 500,),
            Text('v1.0 Tube Mate',style: TextStyle(color:Colors.grey),),
          ],
        ),
      ),
    );
  }
}

class ListVideo extends StatefulWidget {
  final String title;
  final String url;
  ListVideo({this.title, this.url});
  @override
  _ListVideoState createState() => _ListVideoState();
}

class _ListVideoState extends State<ListVideo> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red[600]),
        centerTitle: true,
       title: Text(widget.title,style: TextStyle(color: Colors.red[600],fontWeight: FontWeight.bold),), 
      ),
      drawer:  MyDrawer(),
      body:  Center(
        child: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);
            return snapshot.hasData
                ?  PlayListVideo(
                    list: snapshot.data,
                  )
                :  CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class PlayListVideo extends StatelessWidget {
  final List list;
  PlayListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return  Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 20.0,
                      child: Column(
              children: <Widget>[
                 GestureDetector(
                  onTap: () => Navigator.of(context).push( CupertinoPageRoute(
                      builder: (BuildContext context) =>  VideoPlay(
                            url:"https://youtube.com/embed/${list[i]['contentDetails']['videoId']}",
                          ))),
                  child:  Container(
                    height: 210.0,
                    decoration:  BoxDecoration(
                        image:  DecorationImage(
                            image:  NetworkImage(
                                list[i]['snippet']['thumbnails']['high']['url']),
                            fit: BoxFit.cover)),
                  ),
                ),
                 Padding(padding: const EdgeInsets.all(10.0)),
                 Text(
                  list[i]['snippet']['title'],
                  style:  TextStyle(fontSize: 18.0),
                ),
                 Padding(padding: const EdgeInsets.all(10.0)),
                 Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class VideoPlay extends StatelessWidget {
  final String url;
  VideoPlay({this.url});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  WebviewScaffold(
        url: url,
      ),
    );
  }
}