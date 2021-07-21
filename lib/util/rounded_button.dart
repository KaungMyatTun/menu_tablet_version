import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class RoundedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final bool isClickable;
  final String colorString;
  final double radius;
  final double width;

  RoundedButton({
    @required this.onPressed,
    @required this.text,
    this.isClickable = true,
    this.colorString,
    this.radius = 0.0,
    this.width =  double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        height: 40,
        width: 100,
        child: RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5)),
          padding: EdgeInsets.all(8.0),
          color: HexColor(colorString),
          child: Text(text,
              style: TextStyle(
                  color: colorString != "#ffffff"
                      ? Colors.white
                      : HexColor(secondaryColor),
                  fontSize: subTitleTxtFontSize)),
          onPressed: isClickable ? onPressed : null,
        ),
      ),
    );
  }
}
