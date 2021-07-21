import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/util/rounded_button.dart';

class DialogManager {
  yesorNoButtonDialog(BuildContext context, String txtContent, String btnOkText,
      String btnCancelText, DialogType dialogType) {
    return AwesomeDialog(
      width: 500,
      animType: AnimType.SCALE,
      dialogType: dialogType,
      headerAnimationLoop: false,
      title: "hello",
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Center(
          child: Text(txtContent,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: HexColor(textColor), fontWeight: FontWeight.bold)),
        ),
      ),
      context: context,
      btnOk: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: RoundedButton(
          text: btnOkText,
          onPressed: () {
            // yesFun();
          },
          colorString: primaryColor,
          isClickable: true,
        ),
      ),
      btnCancel: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: RoundedButton(
          text: btnCancelText,
          onPressed: () {
            Navigator.pop(context);
          },
          colorString: "#F44336",
          isClickable: true,
        ),
      ),
    ).show();
  }

  // sample alert dialg
  alertDialog(BuildContext context, DialogType dialogType, String btnText,
      String txtContent) {
    return AwesomeDialog(
      width: 500,
      animType: AnimType.SCALE,
      dialogType: dialogType,
      headerAnimationLoop: false,
      title: "hello",
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Center(
              child: Text(txtContent,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: HexColor(textColor),
                      fontWeight: FontWeight.bold,
                      fontSize: titleFontSize)),
            ),
          ),
          Container(
            width: 200,
            height: 70,
            margin:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
            child: RoundedButton(
              text: btnText,
              onPressed: () {
                Navigator.pop(context);
              },
              colorString: primaryColor,
              isClickable: true,
            ),
          )
        ],
      ),
      context: context,
    ).show();
  }

  // merge table alert dialog
  mergeTableAlertDialog(BuildContext context, String firstTable,
      String secondTable, String btnCancelText, String btnOkText) {
    return AwesomeDialog(
        width: 500,
        dialogType: DialogType.QUESTION,
        headerAnimationLoop: false,
        animType: AnimType.SCALE,
        context: context,
        btnCancel: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: RoundedButton(
            text: btnCancelText,
            onPressed: () {
              Navigator.pop(context);
            },
            colorString: "#ffffff",
            isClickable: true,
          ),
        ),
        btnOk: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: RoundedButton(
            text: btnOkText,
            onPressed: () {},
            colorString: primaryColor,
            isClickable: true,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(primaryColor),
                      ),
                      child: Center(
                        child: Text(
                          firstTable,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text("+",
                            style: TextStyle(
                                color: HexColor(primaryColor),
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(primaryColor),
                      ),
                      child: Center(
                        child: Text(
                          secondTable,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Merging Tables",
                    style: TextStyle(
                        color: HexColor(textColor),
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    "Are you sure you want to merge these tables?",
                    style: TextStyle(
                        color: HexColor(textColor),
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        )).show();
  }

  // move table alert dialog
  moveTableAlertDialog(BuildContext context, String firstTable,
      String secondTable, String btnCancelText, String btnOkText) {
    return AwesomeDialog(
        width: 500,
        dialogType: DialogType.QUESTION,
        headerAnimationLoop: false,
        animType: AnimType.SCALE,
        context: context,
        btnCancel: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: RoundedButton(
            text: btnCancelText,
            onPressed: () {
              Navigator.pop(context);
            },
            colorString: "#ffffff",
            isClickable: true,
          ),
        ),
        btnOk: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: RoundedButton(
            text: btnOkText,
            onPressed: () {},
            colorString: primaryColor,
            isClickable: true,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(primaryColor),
                      ),
                      child: Center(
                        child: Text(
                          firstTable,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text("->",
                            style: TextStyle(
                                color: HexColor(primaryColor),
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor(primaryColor),
                      ),
                      child: Center(
                        child: Text(
                          secondTable,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Moving Table",
                    style: TextStyle(
                        color: HexColor(textColor),
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    "Are you sure you want to move $firstTable to $secondTable?",
                    style: TextStyle(
                        color: HexColor(textColor),
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        )).show();
  }
}
