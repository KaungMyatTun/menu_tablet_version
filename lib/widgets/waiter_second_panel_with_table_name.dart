import 'package:flutter/material.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/rs_btn.dart';

class WaiterSecondPanelWithTableName extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  WaiterSecondPanelWithTableName({@required this.bloc});
  @override
  _WaiterSecondPanelWithTableNameState createState() =>
      _WaiterSecondPanelWithTableNameState();
}

class _WaiterSecondPanelWithTableNameState
    extends State<WaiterSecondPanelWithTableName> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: _secondPanelWithTable(),
      ),
    );
  }

  _secondPanelWithTable() {
    List<int> gridItem = [for (int i = 0; i < 26; i++) i];
    List<Widget> gvCard = List();
    gridItem.forEach((item) {
      gvCard.add(Column(
        children: [
          Container(
            width: 120,
            height: 120,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: HexColor(primaryColor),
            ),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.bloc.showWaiterTableDetailScreenSink.add(true);
                });
              },
              child: RsBtn(btnTxt: "T$item", colorString: orderCardColor),
            ),
          ),
        ],
      ));
    });
    return gvCard;
  }
}
