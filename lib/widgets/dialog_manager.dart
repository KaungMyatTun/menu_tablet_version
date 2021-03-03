import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/util/rounded_button.dart';

class DialogManager {
  yesorNoButtonDialog(BuildContext context, String txtContent, String btnOkText,
      String btnCancelText, DialogType dialogType) {
    return AwesomeDialog(
      animType: AnimType.SCALE,
      dialogType: dialogType,
      title: "hello",
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Center(
          child: Text(txtContent,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  color: HexColor(textColor),
                  fontWeight: FontWeight.bold)),
        ),
      ),
      context: context,
      btnOk: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: 
        RoundedButton(
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
}
