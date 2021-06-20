import 'dart:ui';

import '../../shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onChange,
  Function onSaved,
  Function onTap,
  String hint,
  int maxLines=1,
  bool isPassword = false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      //style: TextStyle(),
      maxLines: maxLines,
      controller: controller,
      //textAlign: TextAlign.right,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      onSaved: onSaved,
      validator: validate,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(bottom: 30),
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
          bottom: Radius.circular(10.0),
        )),
      ),
    );

Widget defaultButton({
  BuildContext context,
  double width = double.infinity,
  Color background = defaultColor,
  Color borderColor =Colors.grey,
  bool isUpperCase = true,
  double fontSize,
  double radius = 3.0,
  Color textColor=Colors.black,
  @required Function function,
  @required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(isUpperCase ? text.toUpperCase() : text,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: textColor,fontSize: fontSize),),
      ),
      decoration: BoxDecoration(
       // border: Border.all(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton(
        {@required Function function,
        @required String text,
        TextStyle style}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: style,
      ),
    );

Widget orDivider(context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
    width: size.width * 0.8,
    child: Row(
      children: <Widget>[
        buildDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OR",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        buildDivider(),
      ],
    ),
  );
}

Expanded buildDivider() {
  return Expanded(
    child: Divider(
      color: defaultColor,
      height: 2,
      thickness: 1.5,
    ),
  );
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
