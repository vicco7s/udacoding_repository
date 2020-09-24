import 'package:flutter/material.dart';
import 'package:movie_simple/constant/constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMovie extends StatefulWidget {
  final List list;
  final int i;
  DetailMovie({this.list,this.i});
  @override
  _DetailMovieState createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  YoutubePlayerController _controller;
  bool isFavorit = false;
  
  GlobalKey<ScaffoldState> _kd = GlobalKey<ScaffoldState>();


  setFav() {
   setState(() {
     isFavorit = !isFavorit;
    });
  }


   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
   @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.list[widget.i]['ytube'].split('=')[1],
      flags: YoutubePlayerFlags(
        autoPlay: false,
        // hideThumbnail: false,
        mute: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _kd,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kColorBlue),
        backgroundColor: Colors.white,
       centerTitle: true,
       title: Text(widget.list[widget.i]['title'],style: kColorText,),
      ),
      body: SingleChildScrollView(
        child: Column(
         children: [
           Container(
             child: YoutubePlayer(
               aspectRatio: 16/9,
               controller: _controller,
              //  thumbnail: Image.network('https://i3.ytimg.com/vi_webp/https://youtu.be/8rauD1vxMCw/sddefault.webp'),
               ),
           ),
           Container(
             margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
             child: Card(
               elevation: 10.0,
               child: Container(
                child: ListTile(
                 title: Text('Durasi : '+ widget.list[widget.i]['duration'],style: kColorP,), 
                 trailing:  IconButton(
                     icon: isFavorit ? Icon(Icons.favorite,color: kColorPink,):Icon(Icons.favorite_border,color: kColorPink,), 
                   onPressed: (){
                     setFav();
                   }),
                ), 
               ), 
             ),
           ),
           Container(
             margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Card(
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Expanded(child: Text(widget.list[widget.i]['detail'],style: kColorP,)),
              ),
            ), 
           ),
           Container(
             margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Card(
              elevation: 10.0,
              child: Container(
                // padding: EdgeInsets.fromLTRB(150, 10, 150, 20),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text('Tahun : '+ ' '+widget.list[widget.i]['year'],style: kColorP,), 
                    ), 
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Text('rating : '+ ' '+widget.list[widget.i]['rating'],style: kColorP,), 
                    ), 
                    SizedBox(height: 10,),
                    ListTile(
                      leading: Text('Negara : '+ ' '+widget.list[widget.i]['country'],style: kColorP,), 
                    ),
                  ],
                ),
              ),
            ), 
           )
         ], 
        ),
      ),
    );
  }
}