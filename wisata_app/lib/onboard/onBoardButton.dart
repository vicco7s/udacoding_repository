import 'package:flutter/material.dart';
import 'package:wisata_app/util/count.dart';

class ButtonOnboard extends StatelessWidget { //buttonOnboard
 final Function onTap;

 ButtonOnboard({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30.0),
          child: Text(
            'Get started',
            style: TextStyle(
              color: bColorBlue,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget { //nextpage
  final Function onTap;

  NextPage({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.bottomRight,
      child: FlatButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Next',style: kOnbordText,),
            SizedBox(width: 10.0),
            Icon(Icons.arrow_forward,color: bColorBlue,size: 30.0),
          ],
        ),
      ),
    );
  }
}

class Animated extends StatelessWidget { // animated onboarding idication
  final double width;
  final Color color;

  Animated({this.width,this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    );
  }
}