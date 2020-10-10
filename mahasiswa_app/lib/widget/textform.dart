// 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController textControl;
  final String textHint;
  final TextInputType numbertype;

  TextForm({this.textControl,this.textHint,this.numbertype});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
          if(value==null || value.isEmpty){
            return 'mohon isi data ';
          }else{
            return null;
          }
        },
      keyboardType: numbertype,
      controller: textControl,
      decoration: InputDecoration(
        hintText: textHint,
        fillColor: Colors.white,
        filled: true,
        ),
      );
  }
}