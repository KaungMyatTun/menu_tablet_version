import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/util/rounded_button.dart';

class WaiterOrderCardContent extends StatefulWidget {
  final String tableID;
  final String orderID;
  final String itemCountOnOrder;
  final String paymentStatus;
  final String orderStatus;
  WaiterOrderCardContent(
      {this.tableID,
      this.orderID,
      this.itemCountOnOrder,
      this.paymentStatus,
      this.orderStatus});
  @override
  _WaiterOrderCardContentState createState() => _WaiterOrderCardContentState();
}

class _WaiterOrderCardContentState extends State<WaiterOrderCardContent> {
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
        SizedBox(height: 20),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                "${widget.itemCountOnOrder} orders",
                style: TextStyle(
                    fontSize: normalTxtFontSize,
                    fontWeight: FontWeight.bold,
                    color: HexColor(textColor)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Order ID",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: normalTxtFontSize,
                            fontWeight: FontWeight.normal,
                            color: HexColor(textColor)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ": ${widget.orderID}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: normalTxtFontSize,
                            fontWeight: FontWeight.normal,
                            color: HexColor(textColor)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Payment",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: normalTxtFontSize,
                            fontWeight: FontWeight.normal,
                            color: HexColor(textColor)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ": ${widget.paymentStatus}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: normalTxtFontSize,
                            fontWeight: FontWeight.bold,
                            color: HexColor(textColor)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Status",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: normalTxtFontSize,
                            fontWeight: FontWeight.normal,
                            color: HexColor(textColor)),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ": ${widget.orderStatus}",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: normalTxtFontSize,
                            fontWeight: FontWeight.normal,
                            color: HexColor(textColor)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 100,
                  height: 55,
                  child: RoundedButton(
                    onPressed: () {},
                    text: "Serve",
                    colorString: primaryColor,
                  ))
            ],
          ),
        ))
      ],
    );
  }
}
