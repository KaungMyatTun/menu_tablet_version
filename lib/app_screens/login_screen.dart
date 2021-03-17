import 'package:flutter/material.dart';
import 'package:menu_tablet/app_screens/kitchen_home_screen.dart';
import 'package:menu_tablet/app_screens/waiter_home_screen.dart';
import 'package:menu_tablet/bloc/menu_tablet_main_bloc.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';
import 'package:menu_tablet/util/rounded_button.dart';
import 'package:menu_tablet/widgets/custom_text_feild_form.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  final MenuTabletMainBloc bloc;
  LoginScreen({@required this.bloc});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: HexColor(secondaryColor),
        elevation: 0,
      ),
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
                    padding: EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                    child: SingleChildScrollView(
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
                              "Username:",
                              style: TextStyle(
                                  color: HexColor(loginTxtColor),
                                  fontWeight: FontWeight.bold,
                                  fontSize: subTitleTxtFontSize),
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomTextFieldForm(
                            controller: usernameController,
                            helperText: "Username",
                            hintText: "Username",
                            labelText: "Username",
                            validator: (val) =>
                                val.length == 0 ? "Required" : null,
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password:",
                              style: TextStyle(
                                  color: HexColor(loginTxtColor),
                                  fontWeight: FontWeight.bold,
                                  fontSize: subTitleTxtFontSize),
                            ),
                          ),
                          SizedBox(height: 20),
                          CustomTextFieldForm(
                            controller: passwordController,
                            helperText: "Password",
                            hintText: "Password",
                            labelText: "Password",
                            validator: (val) =>
                                val.length == 0 ? "Required" : null,
                          ),
                          SizedBox(height: 10),
                          RoundedButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                // Navigator.pushReplacement(
                                //     context,
                                //     PageTransition(
                                //         duration: Duration(milliseconds: 500),
                                //         type: PageTransitionType.rightToLeft,
                                //         child: KitchenHomeScreen()));
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        duration: Duration(milliseconds: 500),
                                        type: PageTransitionType.rightToLeft,
                                        child: WaiterHomeScreen(bloc: widget.bloc,)));
                              }
                            },
                            text: "CONTINUE",
                            colorString: loginTxtColor,
                            isClickable: true,
                          )
                        ],
                      ),
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
