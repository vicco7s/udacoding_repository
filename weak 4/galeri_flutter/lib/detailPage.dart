import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({@required this.assets});
  
  ImageProvider assets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          child: Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Card(
                elevation: 30.0,
                child: Image(
                  fit: BoxFit.fill,
                  image: assets),
              ),
            )),
          onTap: () {
            Navigator.pop(context);
          },
        ), 
    );
  }
}