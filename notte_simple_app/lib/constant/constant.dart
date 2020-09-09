import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kColorBlue = Color(0xff6168e9);
const kColorPink = Color(0xfff67eae);
const kColorGrey = Color(0xffbec1c7);

const tColorButton = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold
);

const kColorField = TextStyle(
  color: Colors.black, 
  fontWeight: FontWeight.bold,
);
const kColorText = TextStyle(
  color: kColorBlue, 
  fontWeight: FontWeight.bold,
);

const tButtonColor = TextStyle(
  color: Colors.white,
);
const tButtonDuo = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold
);

final decorenButton = BoxDecoration(
  color: kColorPink,
  borderRadius: BorderRadius.circular(50),
);

final buttonGesture = BoxDecoration(
  color: kColorPink,
  borderRadius: BorderRadius.circular(50), 
  boxShadow: [
   BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 4), 
   )
 ],
);

final buttonGestures = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(50), 
  boxShadow: [
   BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 4,
      offset: Offset(2, 4), 
   )
 ],
);

final iconNote = Icon(
  Icons.delete,
  color: kColorPink,
);

const alerTextH = TextStyle(
  fontWeight: FontWeight.bold,
  color: kColorPink,
);

const alerTextT = TextStyle(
  fontWeight: FontWeight.bold,
  color: kColorBlue,
);