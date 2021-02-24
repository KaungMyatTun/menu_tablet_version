import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/util/rounded_button.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation animation;
  @override
  void initState() {
    super.initState();
    expandController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    animation = IntTween(begin: 0, end: 4).animate(expandController);
    animation.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(left: BorderSide(color: HexColor("DEDEDE")))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Wrap(
                      children: _secondPanel(),
                    )
                  ],
                ),
              ),
            )),
        Expanded(
            flex: animation.value,
            child: SizedBox(
              width: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border(left: BorderSide(color: HexColor("DEDEDE")))),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        if (expandController.value == 0.0) {
                          expandController.forward();
                        } else {
                          expandController.reverse();
                        }
                      },
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: HexColor(primaryColor),
                              ),
                              margin: EdgeInsets.only(
                                top: 20,
                                left: 10,
                                right: 10,
                              ),
                              width: 30,
                              height: 30,
                              child: Icon(
                                Icons.chevron_left,
                                size: 30,
                                color: Colors.white,
                              ))),
                    ),
                  ],
                ),
              ),
            ))
      ],
    ));
  }

  _secondPanel() {
    List<int> gridItem = [
      0,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25
    ];
    List<Widget> gvCard = List();
    gridItem.forEach((item) {
      gvCard.add(Column(
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor(primaryColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  if (expandController.value == 0.0) {
                    expandController.forward();
                  }
                });
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(3),
                      bottomRight: Radius.circular(3)),
                ),
              ),
            ),
          ),
        ],
      ));
    });
    return gvCard;
  }
}
