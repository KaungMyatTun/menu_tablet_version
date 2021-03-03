import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class KitchenSideBarButton extends StatefulWidget {
  final IconData iconData;
  final String btnTxt;
  final int index;
  KitchenSideBarButton({this.iconData, this.btnTxt, this.index});
  @override
  _KitchenSideBarButtonState createState() => _KitchenSideBarButtonState();
}

class _KitchenSideBarButtonState extends State<KitchenSideBarButton> {
  String selectedTxt;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: highlightColor() ? HexColor(primaryColor) : Colors.white,
      ),
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
    );
  }

  highlightColor() {
    switch (widget.index) {
      case 0:
        {
          if (widget.btnTxt == "Orders") {
            return true;
          } else {
            return false;
          }
        }
        break;
      case 1:
        {
          if (widget.btnTxt == "History") {
            return true;
          } else {
            return false;
          }
        }
        break;
      case 2:
        {
          if (widget.btnTxt == "Logout") {
            return true;
          } else {
            return false;
          }
        }
        break;
    }
  }
}
