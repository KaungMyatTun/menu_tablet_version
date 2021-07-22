import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/waiter_order_detail_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/dialog_manager.dart';
import 'package:menu_tablet/widgets/waiter_second_panel_with_table_detail.dart';
import 'package:menu_tablet/widgets/waiter_second_panel_with_table_name.dart';

class WaiterTableScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  WaiterTableScreen({@required this.bloc});
  @override
  _WaiterTableScreenState createState() => _WaiterTableScreenState();
}

class _WaiterTableScreenState extends State<WaiterTableScreen>
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
    super.dispose();
    expandController.dispose();
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
                    border:
                        Border(left: BorderSide(color: HexColor("DEDEDE")))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: expandController.value == 0.0
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        // table label
                        StreamBuilder(
                          stream: widget.bloc.showWaiterTableDetailScreenStream,
                          initialData: false,
                          builder: (context, snapshot) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  snapshot.data
                                      ? InkWell(
                                          onTap: () {
                                            if (widget.bloc.toShowSaveFirst) {
                                              _showSaveFirstDialog();
                                            } else {
                                              if (expandController.value !=
                                                  0.0) {
                                                expandController.reverse();
                                                setState(() {
                                                  widget.bloc
                                                      .showWaiterTableDetailScreenSink
                                                      .add(false);
                                                });
                                              } else {
                                                setState(() {
                                                  widget.bloc
                                                      .showWaiterTableDetailScreenSink
                                                      .add(false);
                                                });
                                              }
                                            }
                                          },
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
                                                  bottom: 10),
                                              width: 30,
                                              height: 30,
                                              child: Icon(
                                                Icons.chevron_left,
                                                size: 30,
                                                color: Colors.white,
                                              )),
                                        )
                                      : Container(),
                                  Text("Tables",
                                      style: TextStyle(
                                          fontSize: titleFontSize,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            );
                          },
                        ),
                        StreamBuilder(
                          stream: widget.bloc.showWaiterTableDetailScreenStream,
                          initialData: false,
                          builder: (context, snapshot) {
                            return snapshot.data
                                ? WaiterSecondPanelWithTableDetail(
                                    expandController: expandController,
                                    bloc: widget.bloc,
                                  )
                                : WaiterSecondPanelWithTableName(
                                    bloc: widget.bloc);
                          },
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
                                    if (widget.bloc.toShowSaveFirst) {
                                      _showSaveFirstDialog();
                                    } else {
                                      if (expandController.value == 0.0) {
                                        expandController.forward();
                                      } else {
                                        expandController.reverse();
                                      }
                                      setState(() {
                                        selectedIndex = null;
                                      });
                                    }
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
                                    style:
                                        TextStyle(color: HexColor(textColor)),
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
  }

  // show save first dialog fun
  _showSaveFirstDialog() {
    DialogManager dm = new DialogManager();
    dm.alertDialog(context, DialogType.WARNING, "OK",
        "Please save your menu edition first");
  }
}
