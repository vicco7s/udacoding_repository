import 'package:flutter/material.dart';
import 'package:galeri_flutter/imagenetwork.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<ImageProvider> asset = [
  NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg'),
  NetworkImage('https://thumbs-prod.si-cdn.com/nnJARGtKrLypH4y3Vov2zGTG4xw=/fit-in/1600x0/filters:focal(554x699:555x700)/https://public-media.si-cdn.com/filer/a4/04/a404c799-7118-459a-8de4-89e4a44b124f/img_1317.jpg'),
];

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
                padding: EdgeInsets.all(5.0),
                child: Image(
                  fit: BoxFit.fill,
                  image: asset[index]
                )
              ),
            ),
          );
        }),)
      )
    );
  }
}