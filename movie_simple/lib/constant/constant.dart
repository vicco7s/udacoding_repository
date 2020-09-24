import 'package:flutter/material.dart';

const kColorBlue = Color(0xff6168e9);
const kColorPink = Color(0xfff67eae);
const kColorGrey = Color(0xffbec1c7);

const tColorButton = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold
);

const kColorField = TextStyle(
  color: kColorGrey, 
  fontWeight: FontWeight.bold,
);
const kColorNote = TextStyle(
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
  Icons.arrow_forward_ios,
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

const kColorT = TextStyle(
  color: kColorBlue
);
const kColorP = TextStyle(
  color: kColorPink
);