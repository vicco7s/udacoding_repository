import 'package:flutter/material.dart';
import 'package:galeri_flutter/detailPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<ImageProvider> asset = [
  NetworkImage('https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/cat_relaxing_on_patio_other/1800x1200_cat_relaxing_on_patio_other.jpg'),
  NetworkImage('https://thumbs-prod.si-cdn.com/nnJARGtKrLypH4y3Vov2zGTG4xw=/fit-in/1600x0/filters:focal(554x699:555x700)/https://public-media.si-cdn.com/filer/a4/04/a404c799-7118-459a-8de4-89e4a44b124f/img_1317.jpg'),
  NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Barnevelder_Cock.png/250px-Barnevelder_Cock.png'),
  NetworkImage('https://paktanidigital.com/artikel/wp-content/uploads/2019/09/Tips-Mudah-Mengawinkan-Ayam-Bangkok.jpeg'),
  NetworkImage('https://www.odt.co.nz/sites/default/files/story/2020/07/gettyimages-138310605.jpg'),
  NetworkImage('https://news.cgtn.com/news/77416a4e3145544d326b544d354d444d3355444f31457a6333566d54/img/37d598e5a04344da81c76621ba273915/37d598e5a04344da81c76621ba273915.jpg'),
  NetworkImage('https://cf.bstatic.com/images/hotel/max1024x768/257/257720006.jpg'),
  NetworkImage('https://www.rubikon.news/uploads/store/3a92c509be6582ebfdc5a3b1b3660a27.jpg'),
  NetworkImage('https://newlyswissed.com/wp-content/uploads/2019/10/Hotel-Paradies-Ftan-04.jpg'),
  NetworkImage('https://thumb2.holidaypirates.com/20jrmMfh3Zb7UGjgOcqPGPjW0Mk=/1600x720/https://media.mv.urlaubspiraten.de/images/2016/09/57d2de9e0ea4f846078188dex78pbi.jpg'),
  NetworkImage('https://i.pinimg.com/originals/05/f5/f9/05f5f95755235900841da6c75c1958ef.jpg'),
  NetworkImage('https://images.squarespace-cdn.com/content/v1/5a9a88bbf93fd4aee7146202/1535629687275-M5W1ERFBPL1PKLLXHEWG/ke17ZwdGBToddI8pDm48kEZ6JykEgB4iV4P2rR6c0eoUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcK1mU_GrmyQgxaOF01nSfMqL-kKxo4qf3wPFRtT_Iu2i5Lv7dhNfpsisJZBtrhCXz/first-time-ubud.jpg.jpg'),
  
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
            padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
            child: Card(
              elevation: 20,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: GestureDetector(
                      child: Image(
                        fit: BoxFit.fill,
                        image: asset[index]
                      ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(
                    assets: asset[index],
                  );}));
                 },
                )
              ),
            ),
          );
        }),)
      )
    );
  }
}