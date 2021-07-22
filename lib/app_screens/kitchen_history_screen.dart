import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/kitchen_history_detail_screen.dart';
import 'package:menu_tablet/app_screens/kitchen_home_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/network/model/selected_order_model.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/kitchen_order_card_content.dart';

class KitchenHistoryScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  KitchenHistoryScreen({@required this.bloc});
  @override
  _KitchenHistoryScreenState createState() => _KitchenHistoryScreenState();
}

class _KitchenHistoryScreenState extends State<KitchenHistoryScreen>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation animation;
  int selectedIndex;

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
        // second panel
        Expanded(
            flex: 4,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(left: BorderSide(color: HexColor("DEDEDE")))),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: expandController.value == 0.0
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Wrap(
                        children: _secondPanel(),
                      )
                    ],
                  ),
                ),
              ),
            )),
        // third panel
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
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              if (expandController.value == 0.0) {
                                expandController.forward();
                              } else {
                                expandController.reverse();
                              }
                              setState(() {
                                selectedIndex = null;
                              });
                            },
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: HexColor(primaryColor),
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 8,
                                      left: 16,
                                      right: 8,
                                    ),
                                    width: 30,
                                    height: 30,
                                    child: Icon(
                                      Icons.chevron_left,
                                      size: 30,
                                      color: Colors.white,
                                    )))),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.bloc.selectedOrderModel.tableId,
                                  style: TextStyle(
                                      color: HexColor(textColor),
                                      fontWeight: FontWeight.bold,
                                      fontSize: tableNumberFontSize),
                                ),
                                Text(
                                  widget.bloc.selectedOrderModel.orderId,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: HexColor(textColor),
                                      fontWeight: FontWeight.bold,
                                      fontSize: normalTxtFontSize),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              "10:08 AM Jan 8, 2021",
                              textAlign: TextAlign.right,
                              style: TextStyle(color: HexColor(textColor)),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: HexColor(separatorColor),
                      thickness: 1.5,
                    ),
                    Expanded(
                      child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          child: KitchenHistoryDetailScreen(bloc: widget.bloc)),
                    )
                  ],
                ),
              ),
            ))
      ],
    ));
}
_secondPanel() {
    List<int> gridItem = [for (int i = 0; i < 2; i++) i];
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
                  selectedIndex = item;
                   // set selected table to bloc
                  SelectedOrderModel model = new SelectedOrderModel();
                  model.tableId = item.toString();
                  model.orderId = "Order ID: 333333";
                  widget.bloc.selectedOrderModel = model;
                });
              },
              child: Container(
                  margin: EdgeInsetsDirectional.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: selectedIndex == item
                        ? Colors.white
                        : HexColor(orderCardColor),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(3),
                        bottomRight: Radius.circular(3)),
                  ),
                  child: KitchenOrderCardContent(
                    tableID: item.toString(),
                    orderID: "#123",
                    itemCountOnOrder: "8",
                  )),
            ),
          ),
        ],
      ));
    });
    return gvCard;
  }
}
