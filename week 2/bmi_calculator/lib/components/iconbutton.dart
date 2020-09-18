import 'package:flutter/material.dart';


class ButtonIcon extends StatelessWidget {
  ButtonIcon({@required this.icon , this.onPress});

  final Function onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
     child: Icon(icon), 
    );
  }
}
