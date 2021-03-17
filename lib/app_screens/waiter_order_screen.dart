import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/waiter_order_detail_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/waiter_order_card_content.dart';

class WaiterOrderScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  WaiterOrderScreen({@required this.bloc});
  @override
  _WaiterOrderScreenState createState() => _WaiterOrderScreenState();
}

class _WaiterOrderScreenState extends State<WaiterOrderScreen>
    with SingleTickerProviderStateMixin {
  AnimationController expandController;
  Animation animation;
  int selectedIndex;
  bool reloadPage = false;

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
    return StreamBuilder<bool>(
      stream: widget.bloc.waiterThirdPageReloadStream,
      builder: (content, snapshot) {
        print(snapshot.data);
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
                        border: Border(
                            left: BorderSide(color: HexColor("DEDEDE")))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              expandController.value == 0.0
                  ? Container()
                  : Expanded(
                      flex: animation.value,
                      child: SizedBox(
                        width: 0.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                  left: BorderSide(color: HexColor("DEDEDE")))),
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
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: HexColor(primaryColor),
                                              ),
                                              margin: EdgeInsets.only(
                                                top: 10,
                                                left: 10,
                                                right: 10,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "T3",
                                            style: TextStyle(
                                                color: HexColor(textColor),
                                                fontWeight: FontWeight.bold,
                                                fontSize: tableNumberFontSize),
                                          ),
                                          Text(
                                            "Order ID : #12332",
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
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        "10:08 AM Jan 8, 2021",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: HexColor(textColor)),
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
                                    child: WaiterOrderDetailScreen(
                                      bloc: widget.bloc,
                                      animationController: expandController,
                                      firstPageIndex: 0,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ))
            ],
          ),
        );
      },
    );
  }

  _secondPanel() {
    List<int> gridItem = [for (int i = 0; i < 26; i++) i];
    List<Widget> gvCard = List();
    gridItem.forEach((item) {
      gvCard.add(Column(
        children: [
          Container(
            width: 180,
            height: 220,
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
                  widget.bloc.waiterThirdPageReloadSink.add(true);
                  reloadPage = true;
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
                  child: WaiterOrderCardContent(
                    tableID: item.toString(),
                    orderID: "#123",
                    itemCountOnOrder: "8",
                    paymentStatus: "Pending",
                    orderStatus: "Ready",
                  )),
            ),
          ),
        ],
      ));
    });
    return gvCard;
  }
}
