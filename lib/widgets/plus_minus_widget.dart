import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class PlusMinusWidget extends StatefulWidget {
  int itemCount;
  PlusMinusWidget({@required this.itemCount});
  @override
  _PlusMinusWidgetState createState() => _PlusMinusWidgetState();
}

class _PlusMinusWidgetState extends State<PlusMinusWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (widget.itemCount != 0) widget.itemCount--;
            });
          },
          child: Container(
            width: 30,
            decoration: BoxDecoration(
                color: HexColor(primaryColor),
                border: Border.all(color: HexColor("#DEDEDE")),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Text(
              "-",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: 30,
          child: Center(
            child: Text("${widget.itemCount}",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.itemCount += 1;
            });

            print(widget.itemCount);
          },
          child: Container(
            width: 30,
            decoration: BoxDecoration(
                color: HexColor(primaryColor),
                border: Border.all(color: HexColor("#DEDEDE")),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Text(
              "+",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
