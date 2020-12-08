import 'package:flutter/material.dart';
import 'package:profil_sekolah/util/const.dart';

class TextForms extends StatelessWidget {
  TextForms({
    this.bordersd,
    this.inputController,
    this.typeinput,
    this.miLine,
    this.mxLine,
    this.lText,
  });

  final TextEditingController inputController;
  final BorderSide bordersd;
  final TextInputType typeinput;
  final int miLine;
  final int mxLine;
  final String lText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      keyboardType: typeinput,
      minLines: miLine,
      maxLines: mxLine,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: bordersd,
        ),
        labelText: lText,
        labelStyle: TextStyle(
          color:cColorsBlue
        ),
      ),
    );
  }
}