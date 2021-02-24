import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/login_screen.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/util/rounded_button.dart';
import 'package:menu_tablet/widgets/custom_text_feild_form.dart';
import 'package:page_transition/page_transition.dart';

class ShopDomainLoginScreen extends StatefulWidget {
  @override
  _ShopDomainLoginScreenState createState() => _ShopDomainLoginScreenState();
}

class _ShopDomainLoginScreenState extends State<ShopDomainLoginScreen> {
  TextEditingController shopDomainTxtEditingController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor(secondaryColor),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 170,
                    height: 60,
                    child: Image.asset("images/menus_logo.jpg"),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 360,
                    height: 304,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: HexColor(loginTxtColor),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Shop Domain:",
                            style: TextStyle(
                                color: HexColor(loginTxtColor),
                                fontWeight: FontWeight.bold,
                                fontSize: subTitleTxtFontSize),
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomTextFieldForm(
                          controller: shopDomainTxtEditingController,
                          helperText: "Shop Domain",
                          hintText: "Shop Domain",
                          labelText: "Shop Domain",
                          validator: (val) =>
                              val.length == 0 ? "Required" : null,
                        ),
                        SizedBox(height: 10),
                        RoundedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                    duration: Duration(milliseconds: 500),
                                      type: PageTransitionType
                                          .rightToLeft,
                                      child: LoginScreen()));
                            }
                          },
                          text: "CONTINUE",
                          colorString: loginTxtColor,
                          isClickable: true,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
