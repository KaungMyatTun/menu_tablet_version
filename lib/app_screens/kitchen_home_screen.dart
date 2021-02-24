import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/history_screen.dart';
import 'package:menu_tablet/app_screens/order_screen.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/sidebar_button.dart';

class KitchenHomeScreen extends StatefulWidget {
  @override
  _KitchenHomeScreenState createState() => _KitchenHomeScreenState();
}

class _KitchenHomeScreenState extends State<KitchenHomeScreen> {
  bool thirdPanel;
  int chosenIndexForSecondPanel;
  @override
  void initState() {
    super.initState();
    thirdPanel = false;
    chosenIndexForSecondPanel = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: HexColor(primaryColor),
        elevation: 0,
        title: Text(
          "Moe Wai Kyaw",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: firstPanel())),
            Expanded(flex: 10, child: _secondPanel())
          ],
        ),
      ),
    );
  }

  Widget firstPanel() {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          height: 120,
          width: 86,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(color: HexColor(primaryColor), width: 2),
                  bottom: BorderSide(color: HexColor(primaryColor), width: 2))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_pin_rounded,
                color: HexColor(secondaryColor),
                size: 50,
              ),
              Text(
                "KITCHEN",
                style: TextStyle(
                    color: HexColor(secondaryColor),
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        SideBarButton(
          iconData: Icons.login,
          btnTxt: "Orders",
          onClick: () {
            print("Orders");
            setState(() {
              chosenIndexForSecondPanel = 0;
            });
          },
        ),
        SizedBox(height: 20),
        SideBarButton(
          iconData: Icons.history,
          btnTxt: "History",
          onClick: () {
            print("History");
            setState(() {
              chosenIndexForSecondPanel = 1;
            });
          },
        ),
        SizedBox(height: 20),
        SideBarButton(
          iconData: Icons.logout,
          btnTxt: "Logout",
          onClick: () {
            print("Logout");
            setState(() {
              chosenIndexForSecondPanel = 2;
            });
          },
        )
      ],
    );
  }

  _secondPanel() {
    switch (chosenIndexForSecondPanel) {
      case 0:
        return OrderScreen();
        break;
      case 1:
        return HistoryScreen();
        break;
      case 2:
        return Text("Logout");
        break;
    }
  }
}
