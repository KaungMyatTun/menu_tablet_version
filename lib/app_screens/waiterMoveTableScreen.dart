import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/widgets/dialog_manager.dart';
import 'package:menu_tablet/widgets/rs_btn.dart';

class WaiterMoveTableScreen extends StatefulWidget {
  @override
  _WaiterMoveTableScreenState createState() => _WaiterMoveTableScreenState();
}

class _WaiterMoveTableScreenState extends State<WaiterMoveTableScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Move Tables",
                  style: TextStyle(
                      fontSize: titleFontSize, fontWeight: FontWeight.bold),
                ),
              ),
              Wrap(children: buildTableList())
            ],
          ),
        ),
      ),
    );
  }

  buildTableList() {
    List<int> gridItem = [for (int i = 0; i < 10; i++) i];
    List<Widget> tableListGVCard = List();
    gridItem.forEach((item) {
      tableListGVCard.add(InkWell(
        onTap: () {
          print(item);
          DialogManager dm = new DialogManager();
          dm.moveTableAlertDialog(context, "T0", "T9", "Cancel", "Sure");
        },
        child: Container(
          height: 80,
          margin: EdgeInsets.all(10),
          child: RsBtn(
            fun: null,
            colorString: orderCardColor,
            btnTxt: "T${item.toString()}",
          ),
        ),
      ));
    });
    return tableListGVCard;
  }
}
