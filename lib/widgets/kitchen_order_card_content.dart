import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class KitchenOrderCardContent extends StatefulWidget {
  final String tableID;
  final String orderID;
  final String itemCountOnOrder;
  KitchenOrderCardContent({@required this.tableID,@required this.orderID,@required this.itemCountOnOrder});
  @override
  _KitchenOrderCardContentState createState() =>
      _KitchenOrderCardContentState();
}

class _KitchenOrderCardContentState extends State<KitchenOrderCardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: HexColor(secondaryColor)),
        ),
        SizedBox(height: 5),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "T${widget.tableID}",
                style: TextStyle(
                    fontSize: tableNumberFontSize,
                    fontWeight: FontWeight.bold,
                    color: HexColor(textColor)),
              ),
              SizedBox(height: 5),
              Text(
                "Order ID: ${widget.orderID}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: normalTxtFontSize,
                    fontWeight: FontWeight.normal,
                    color: HexColor(textColor)),
              ),
              SizedBox(height: 5),
              Text(
                "${widget.itemCountOnOrder} orders",
                style: TextStyle(
                    fontSize: normalTxtFontSize,
                    fontWeight: FontWeight.bold,
                    color: HexColor(textColor)),
              )
            ],
          ),
        ))
      ],
    );
  }
}
