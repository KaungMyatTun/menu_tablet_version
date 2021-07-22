import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class KitchenHistoryDetailScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  KitchenHistoryDetailScreen({@required this.bloc});
  @override
  _KitchenHistoryDetailScreenState createState() =>
      _KitchenHistoryDetailScreenState();
}

class _KitchenHistoryDetailScreenState
    extends State<KitchenHistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Done!",
                style: TextStyle(
                    fontSize: tableNumberFontSize, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                color: Colors.white,
                child: CupertinoScrollbar(
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: createItemList(),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: 50,
                margin:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
                color: Colors.white,
                child: Center(
                    child: Text(
                  "This table was served at 10:39 am.",
                  style: TextStyle(
                    fontSize: titleFontSize,
                    color: HexColor(textColor),
                  ),
                )))
          ],
        ));
  }

  createItemList() {
    List<int> item = [for (int i = 0; i < 5; i++) i];
    List<Widget> gvCard = List();
    item.forEach(((itemIndex) {
      gvCard.add(Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        height: 100,
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
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    "Pizza Marinara Deluxe (Pan Medium)",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: HexColor(textColor),
                        fontSize: subTitleTxtFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "x2",
                  style: TextStyle(
                      color: HexColor(textColor),
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    "Feature: tomatoes, garlic, oregano, and extra virgin olive oil",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        color: HexColor(textColor),
                        fontSize: subTitleTxtFontSize,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            )
          ],
        ),
      ));
    }));
    return gvCard;
  }
}
