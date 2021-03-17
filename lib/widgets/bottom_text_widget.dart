import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class BottomTextWidget extends StatelessWidget {
  final String label;
  final String price;
  BottomTextWidget({this.label, this.price});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                  color: HexColor(textColor),
                  fontSize: subTitleTxtFontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Expanded(
            child: Text(
              "MMK $price",
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: HexColor(textColor),
                  fontSize: subTitleTxtFontSize,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
