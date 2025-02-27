import 'package:flutter/material.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/network/model/selected_order_model.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/waiter_order_card_content.dart';

class WaiterSecondPanelWithTableDetail extends StatefulWidget {
  final AnimationController expandController;
  final MenuTabletMainBloc bloc;
  WaiterSecondPanelWithTableDetail(
      {@required this.expandController, @required this.bloc});
  @override
  _WaiterSecondPanelWithTableDetailState createState() =>
      _WaiterSecondPanelWithTableDetailState();
}

class _WaiterSecondPanelWithTableDetailState
    extends State<WaiterSecondPanelWithTableDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: _secondPanelWithTableDetail(),
      ),
    );
  }

  _secondPanelWithTableDetail() {
    List<int> gridItem = [for (int i = 0; i < 1; i++) i];
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
                  if (widget.expandController.value == 0.0) {
                    widget.expandController.forward();
                  }
                  // set the selected table to bloc
                  SelectedOrderModel model = new SelectedOrderModel();
                  model.tableId = item.toString();
                  model.orderId = "Order ID: 1111111";
                  widget.bloc.selectedOrderModel = model;

                  // reload the third panel
                  widget.bloc.waiterThirdPageReloadSink.add(true);
                });
              },
              child: Container(
                  margin: EdgeInsetsDirectional.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: HexColor(orderCardColor),
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
