import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class RsBtn extends StatefulWidget {
  final Function fun;
  final String colorString;
  final String btnTxt;
  RsBtn({this.fun, this.colorString, this.btnTxt});
  @override
  _RsBtnState createState() => _RsBtnState();
}

class _RsBtnState extends State<RsBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.fun,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: HexColor(widget.colorString)),
        width: 100,
        child: Center(
            child: Text(
          widget.btnTxt,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: titleFontSize,
              fontWeight: FontWeight.bold,
              color: HexColor(textColor)),
        )),
      ),
    );
  }
}
