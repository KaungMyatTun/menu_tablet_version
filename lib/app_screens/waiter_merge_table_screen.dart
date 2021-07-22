import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/widgets/dialog_manager.dart';
import 'package:menu_tablet/widgets/rs_btn.dart';

class WaiterMergeTableScreen extends StatefulWidget {
  @override
  _WaiterMergeTableScreenState createState() => _WaiterMergeTableScreenState();
}

class _WaiterMergeTableScreenState extends State<WaiterMergeTableScreen> {
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Text(
                  "Merge Tables",
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
          dm.mergeTableAlertDialog(context, "T0", "T9", "Cancel", "Sure");
        },
        child: Container(
          height: 80,
          margin: EdgeInsets.all(8),
          child: RsBtn(
            fun: null,
            colorString: secondaryColor,
            btnTxt: "T${item.toString()}",
          ),
        ),
      ));
    });
    return tableListGVCard;
  }
}
