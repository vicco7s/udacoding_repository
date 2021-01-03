
import 'package:flutter/material.dart';
import 'package:wisata_app/util/count.dart';

class ButtonLogin extends StatelessWidget {
final Function onTap;
final Image img;
final Text tButton;

ButtonLogin({@required 
  this.onTap,
  this.img,
  this.tButton,
  
});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: bColorBlue,
        elevation: 20.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            img,
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 2, 0),
              child: tButton,
            )
          ],
        ),
      );
  }
}