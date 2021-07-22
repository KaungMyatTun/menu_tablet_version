import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class TableStatusWidget extends StatefulWidget {
  final int freeTableCount;
  final int activeTableCount;
  final int reserveTableCount;
  TableStatusWidget(
      {@required this.freeTableCount,
      @required this.activeTableCount,
      @required this.reserveTableCount});
  @override
  _TableStatusWidgetState createState() => _TableStatusWidgetState();
}

class _TableStatusWidgetState extends State<TableStatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: status(),
      ),
    );
  }

  status() {
    List<Widget> gvCard = List();
    List<int> gridItem = [1, 2, 3];
    gridItem.forEach((item) {
      gvCard.add(Container(
          height: 40,
          width: 200,
          margin: EdgeInsets.only(right: 20, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[100]),
          child: content(item)));
    });
    return gvCard;
  }

  content(int item) {
    switch (item) {
      case 1:
        return Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: HexColor(orderCardColor),
              margin: EdgeInsets.only(left: 10),
            ),
            SizedBox(width: 10),
            Text(
              "Free",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                  color: HexColor(textColor)),
            ),
            Spacer(),
            Text(widget.freeTableCount.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                    color: HexColor(textColor))),
            SizedBox(width: 10)
          ],
        );
        break;
      case 2:
        return Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: HexColor(primaryColor),
              margin: EdgeInsets.only(left: 10),
            ),
            SizedBox(width: 10),
            Text(
              "Active",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                  color: HexColor(textColor)),
            ),
            Spacer(),
            Text(widget.activeTableCount.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                    color: HexColor(textColor))),
            SizedBox(width: 10)
          ],
        );
        break;
      case 3:
        return Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: HexColor(secondaryColor),
              margin: EdgeInsets.only(left: 10),
            ),
            SizedBox(width: 10),
            Text(
              "Reserved",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleFontSize,
                  color: HexColor(textColor)),
            ),
            Spacer(),
            Text(widget.reserveTableCount.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                    color: HexColor(textColor))),
            SizedBox(width: 10)
          ],
        );
    }
  }
}
