import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:menu_tablet/app_screens/kitchen_history_detail_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/rs_btn.dart';

class KitchenOrderDetailScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  final int tableId;
  KitchenOrderDetailScreen({@required this.bloc,@required this.tableId});
  @override
  _KitchenOrderDetailScreenState createState() =>
      _KitchenOrderDetailScreenState();
}

class _KitchenOrderDetailScreenState extends State<KitchenOrderDetailScreen> {
  List<int> selectedItem = new List();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "Pending... ${widget.tableId}",
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
          Divider(
            color: HexColor(separatorColor),
            thickness: 1.5,
          ),
          Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
            color: Colors.white,
            child: CupertinoScrollbar(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 10),
                  RsBtn(
                    fun: null,
                    btnTxt: "Preparing",
                    colorString: preparingBtnColor,
                  ),
                  SizedBox(width: 10),
                  RsBtn(
                    fun: null,
                    btnTxt: "Cooking",
                    colorString: cookingBtnColor,
                  ),
                  SizedBox(width: 10),
                  RsBtn(
                    fun: null,
                    btnTxt: "Ready To Serve",
                    colorString: readyBtnColor,
                  ),
                  SizedBox(width: 10),
                  RsBtn(
                    fun: null,
                    btnTxt: "Done",
                    colorString: doneBtnColor,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  createItemList() {
    List<int> item = [for (int i = 0; i < 5; i++) i];
    List<Widget> gvCard = List();
    item.forEach(((itemIndex) {
      gvCard.add(InkWell(
        onTap: () {
          setState(() {
            if (selectedItem.contains(itemIndex)) {
              setState(() {
                selectedItem.remove(itemIndex);
              });
            } else {
              selectedItem.add(itemIndex);
            }
          });
        },
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
              SizedBox(height: 10),
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
                  SizedBox(width: 30),
                  selectedItem.contains(itemIndex)
                      ? Icon(
                          Icons.check_circle,
                          color: HexColor(primaryColor),
                        )
                      : Icon(
                          Icons.check_circle_outline_rounded,
                        )
                ],
              )
            ],
          ),
        ),
      ));
    }));
    return gvCard;
  }
}
