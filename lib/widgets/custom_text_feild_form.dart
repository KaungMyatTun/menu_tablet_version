import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_tablet/util/Constants.dart';
import 'package:menu_tablet/util/HexColor.dart';

class CustomTextFieldForm extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String helperText;
  final TextInputType textInputType;
  final Function validator;
  final int maxLines;
  final InputBorder inputBorder;
  final List<TextInputFormatter> inputFormatter;
  final int maxLength;
  final bool readOnly;
  final Icon suffixIcon;
  final String labelText;
  final bool prefixIconVisible;
  final Icons prefixIcon;
  final TextAlign textAlignFlag;
  final bool autoFocusFalg;
  @override
  _CustomTextFieldFormState createState() => _CustomTextFieldFormState();

  CustomTextFieldForm(
      {@required this.controller,
      @required this.helperText,
      @required this.hintText,
      this.suffixIcon,
      this.textInputType,
      this.validator,
      this.maxLines,
      this.inputBorder,
      this.inputFormatter,
      this.maxLength,
      this.readOnly,
      @required this.labelText,
      this.prefixIconVisible = false,
      this.prefixIcon,
      this.autoFocusFalg = false,
      this.textAlignFlag = TextAlign.left});
}

class _CustomTextFieldFormState extends State<CustomTextFieldForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: widget.textAlignFlag,
      autofocus: widget.autoFocusFalg,
      textInputAction: TextInputAction.done,
      autovalidate: false,
      style: TextStyle(
          color: Colors.black,
          fontSize: subTitleTxtFontSize,
          letterSpacing: 0.8),
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(color: HexColor(primaryColor))),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#DBDBDB"), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#DBDBDB"), width: 2.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#DBDBDB"), width: 2.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#DBDBDB"), width: 2.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#DBDBDB"), width: 2.0),
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: subTitleTxtFontSize,
              letterSpacing: 0.8),
          helperStyle: TextStyle(
              color: HexColor(primaryColor),
              fontSize: subTitleTxtFontSize,
              letterSpacing: 0.8),
          errorStyle:
              TextStyle(fontSize: subTitleTxtFontSize, letterSpacing: 0.8),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: subTitleTxtFontSize,
              letterSpacing: 0.8)),
      keyboardType: widget.textInputType == null
          ? TextInputType.text
          : widget.textInputType,
      controller: widget.controller,
      maxLines: widget.maxLines != null ? widget.maxLines : 1,
      validator: widget.validator,
      inputFormatters:
          widget.inputFormatter != null ? widget.inputFormatter : [],
      maxLength: widget.maxLength != null ? widget.maxLength : null,
      readOnly: widget.readOnly != null ? widget.readOnly : false,
    );
  }
}
