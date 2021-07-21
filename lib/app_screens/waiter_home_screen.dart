import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/logout_screen.dart';
import 'package:menu_tablet/app_screens/waiter_order_screen.dart';
import 'package:menu_tablet/app_screens/watier_table_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/widgets/dialog_manager.dart';
import 'package:menu_tablet/widgets/waiter_sidebar_button.dart';

class WaiterHomeScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  WaiterHomeScreen({@required this.bloc});
  @override
  _WaiterHomeScreenState createState() => _WaiterHomeScreenState();
}

class _WaiterHomeScreenState extends State<WaiterHomeScreen> {
  int chosenIndexForSecondPanel;
  @override
  void initState() {
    super.initState();
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
                  child: firstPanel(),
                )),
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
                "Waiter",
                style: TextStyle(
                    color: HexColor(secondaryColor),
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(height: 30),
        InkWell(
            onTap: () {
              setState(() {
                chosenIndexForSecondPanel = 0;
              });
            },
            child: WaiterSideBarButton(
                iconData: Icons.login,
                btnTxt: "Orders",
                index: chosenIndexForSecondPanel)),
        SizedBox(height: 20),
        InkWell(
            onTap: () {
              setState(() {
                chosenIndexForSecondPanel = 1;
              });
            },
            child: WaiterSideBarButton(
                iconData: Icons.login,
                btnTxt: "Tables",
                index: chosenIndexForSecondPanel)),
        SizedBox(height: 20),
        InkWell(
            onTap: () {
              setState(() {
                chosenIndexForSecondPanel = 2;
                DialogManager dm = new DialogManager();
                dm.yesorNoButtonDialog(context, "Are you sure to logout?", "OK",
                    "Cancel", DialogType.QUESTION);
              });
            },
            child: WaiterSideBarButton(
                iconData: Icons.logout,
                btnTxt: "Logout",
                index: chosenIndexForSecondPanel))
      ],
    );
  }

  _secondPanel() {
    switch (chosenIndexForSecondPanel) {
      case 0:
        {
          setState(() {
            widget.bloc.showFirstPageOnWaiter = true;
          });
          return WaiterOrderScreen(
            bloc: widget.bloc,
          );
        }
        break;
      case 1:
        return WaiterTableScreen(bloc: widget.bloc);
        break;
      case 2:
        return LogoutScreen();
        break;
    }
  }
}
