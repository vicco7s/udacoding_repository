import 'package:flutter/material.dart';
import 'package:karyawan_app/constant/cons.dart';



class TextFieldV extends StatelessWidget {
  
  final TextEditingController controlerText;
  final String texthint;
  final bool isValidation;
  final Function validator;
  final Widget icons;
  // final Function onPress;
  // final bool obscureT;

  TextFieldV({
    this.controlerText,
    this.texthint,
    this.isValidation,
    this.validator,
    // this.onPress,
    this.icons,
    // this.obscureT,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator != null ? validator : isValidation ? (String value) => value.isEmpty ? '$texthint tidak boleh kosong' : null : null,
        controller: controlerText,
        // obscureText: obscureT,
        decoration: InputDecoration(
        // suffixIcon: IconButton(
        //                onPressed: onPress,
        //                icon: icons,
        //              ),
        hintText: texthint,
        hintStyle: kColorField,
        enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: kColorGrey) 
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kColorPink)
        ), 
      ),
    );
  }
}