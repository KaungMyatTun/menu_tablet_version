import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/waiter_merge_table_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/util/rounded_button.dart';
import 'package:menu_tablet/widgets/bottom_text_widget.dart';
import 'package:menu_tablet/widgets/rs_btn.dart';

class WaiterOrderDetailScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  final AnimationController animationController;
  final int firstPageIndex;
  WaiterOrderDetailScreen(
      {@required this.bloc, this.animationController, this.firstPageIndex});
  @override
  _WaiterOrderDetailScreenState createState() =>
      _WaiterOrderDetailScreenState();
}

class _WaiterOrderDetailScreenState extends State<WaiterOrderDetailScreen> {
  List<int> selectedItem = new List();
  bool editMenuFlag = false;
  int contentIdForThirdPanel = 0; // 0 for menu item list, 1 for merge tables, 2 for move table

  @override
  void initState() {
    super.initState();
    pageRefresh();
  }

  pageRefresh() {
    print(contentIdForThirdPanel);
    setState(() {
      widget.bloc.waiterThirdPageReloadSink.add(false);
    });
  }

  contentOnThirdPanel() {
    switch (contentIdForThirdPanel) {
      case 0:
        return menuItemList();
        break;
      case 1:
        return WaiterMergeTableScreen();
        break;
      case 2:
        return Container();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.bloc.waiterThirdPageReloadStream,
        initialData: false,
        builder: (content, snapshot) {
          if (snapshot.data) {
            contentIdForThirdPanel = 0;
            editMenuFlag = false;
          }
          return Container(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: [
                      Expanded(child: contentOnThirdPanel()),
                      Divider(
                        color: HexColor(separatorColor),
                        thickness: 1.5,
                      ),
                      Container(
                        height: 80,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 8.0),
                        color: Colors.white,
                        child: CupertinoScrollbar(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              contentIdForThirdPanel != 0
                                  ? SizedBox(width: 10)
                                  : Container(),
                              contentIdForThirdPanel != 0
                                  ? RsBtn(
                                      fun: viewMenusFun,
                                      colorString: "#F9C00C",
                                      btnTxt: "View Menus",
                                    )
                                  : Container(),
                              contentIdForThirdPanel == 0
                                  ? SizedBox(width: 10)
                                  : Container(),
                              contentIdForThirdPanel == 0
                                  ? RsBtn(
                                      fun: editMenusFun,
                                      colorString: "#F9C00C",
                                      btnTxt: "Edit Menus",
                                    )
                                  : Container(),
                              SizedBox(width: 10),
                              RsBtn(
                                fun: mergeTablesFun,
                                colorString: "#F9C00C",
                                btnTxt: "Merge Tables",
                              ),
                              SizedBox(width: 10),
                              RsBtn(
                                fun: moveTableFun,
                                colorString: "#F9C00C",
                                btnTxt: "Move Table",
                              ),
                              SizedBox(width: 10),
                              RsBtn(
                                fun: null,
                                colorString: doneBtnColor,
                                btnTxt: "Done",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )));
        });
  }

  menuItemList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 55,
                child: Center(
                  child: Text(
                    "Pending...",
                    style: TextStyle(
                        fontSize: tableNumberFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              editMenuFlag
                  ? Container(
                      width: 100,
                      height: 55,
                      child: RoundedButton(
                        onPressed: () {
                          setState(() {
                            editMenuFlag = false;
                          });
                        },
                        text: "Save",
                        colorString: primaryColor,
                      ))
                  : Container()
            ],
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: Container(
            color: Colors.white,
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Wrap(
                      children: createItemList(),
                    ),
                    SizedBox(height: 20),
                    BottomTextWidget(
                      label: "Sub Total",
                      price: "18900",
                    ),
                    BottomTextWidget(
                      label: "Government Tax",
                      price: "18900",
                    ),
                    BottomTextWidget(
                      label: "Discount",
                      price: "18900",
                    ),
                    BottomTextWidget(
                      label: "Total",
                      price: "18900",
                    ),
                    BottomTextWidget(
                      label: "Payment",
                      price: "18900",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  createItemList() {
    List<int> item = [for (int i = 0; i < 5; i++) i];
    List<Widget> gvCard = List();
    item.forEach(((itemIndex) {
      gvCard.add(Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        height: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Pizza Marinara Deluxe (Pan Medium)",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: HexColor(textColor),
                    fontSize: subTitleTxtFontSize,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    "MMK 19000",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: HexColor(textColor),
                        fontSize: subTitleTxtFontSize,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text("Preparing",
                      style: TextStyle(
                          color: HexColor(primaryColor),
                          fontSize: subTitleTxtFontSize,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 10),
                editMenuFlag
                    ? plusMinusItemWidget(2)
                    : Text(
                        "x2",
                        style: TextStyle(
                            color: HexColor(textColor),
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold),
                      ),
              ],
            )
          ],
        ),
      ));
    }));
    return gvCard;
  }

  plusMinusItemWidget(int itemCount) {
    int i = 0;
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              i--;
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
            child: Text("$i",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              i = 1;
            });
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

  viewMenusFun() {
    setState(() {
      contentIdForThirdPanel = 0;
      editMenuFlag = false;
    });
  }

  editMenusFun() {
    setState(() {
      editMenuFlag = true;
      widget.bloc.waiterThirdPageReloadSink.add(false);
    });
  }

  mergeTablesFun() {
    setState(() {
      contentIdForThirdPanel = 1;
      widget.bloc.waiterThirdPageReloadSink.add(false);
    });
  }

  moveTableFun() {
    setState(() {
      contentIdForThirdPanel = 2;
      widget.bloc.waiterThirdPageReloadSink.add(false);
    });
  }

  doneFun() {}
}
