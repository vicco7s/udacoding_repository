import 'package:flutter/material.dart';
import 'package:profil_sekolah/util/const.dart';

class ButtonLogin extends StatelessWidget {
  final Function onPress;
  final EdgeInsetsGeometry paddings;
  final Widget texts;
  final AssetImage images;

  ButtonLogin({
    this.images,
    this.onPress,
    this.paddings,
    this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPress,
      splashColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: cColorsBlue),
      child: Padding(
        padding: paddings,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: images, height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: texts,
            )
          ],
        ),
      ),
    );
  }
}
