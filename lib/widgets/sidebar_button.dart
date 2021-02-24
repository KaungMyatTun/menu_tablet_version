import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class SideBarButton extends StatefulWidget {
  final IconData iconData;
  final String btnTxt;
  final Function onClick;
  SideBarButton({this.iconData, this.btnTxt, this.onClick});
  @override
  _SideBarButtonState createState() => _SideBarButtonState();
}

class _SideBarButtonState extends State<SideBarButton> {
  String selectedTxt;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        width: 80,
        height: 80,
        color: widget.btnTxt == selectedTxt
            ? HexColor(primaryColor)
            : Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.iconData,
              color: HexColor("#565656"),
              size: 30,
            ),
            SizedBox(height: 10),
            Text(
              widget.btnTxt,
              style: TextStyle(color: HexColor(textColor)),
            )
          ],
        ),
      ),
    );
  }
}
