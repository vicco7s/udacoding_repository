import 'package:flutter/material.dart';

class Result_Gender extends StatelessWidget {
  Result_Gender({@required this.chardchild,this.colour,this.onPress});

  final Color colour;
  final Widget chardchild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
         padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
         decoration: BoxDecoration(
           color: colour,
           borderRadius: BorderRadius.circular(50.0),
         ),
        child: chardchild,
      ) ,
    );
  }
}