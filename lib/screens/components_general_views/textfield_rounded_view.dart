import 'package:flutter/material.dart';
import 'package:elokyetu/util/size/size.dart';

// ignore: must_be_immutable
class TextFieldRoundedView extends StatelessWidget {
  TextFieldRoundedView(
      {required this.title,
      this.colorLetter,
      this.colorBorder,
      this.submited,
      this.type,
      this.controller,
      this.fontWeight,
      this.colorBackground,
      this.sizeLetter,
      this.password,
      this.height,
      this.width});

  final String title;
  final double? sizeLetter;
  final Color? colorLetter;
  final Color? colorBackground;
  final FontWeight? fontWeight;
  final Color? colorBorder;
  final double? height;
  final TextEditingController? controller;
  final double? width;
  final bool? password;
  final TextInputType? type;
  final Function(String value)? submited;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      clipBehavior: Clip.antiAlias,
      height: height ?? 45,
      width: width ?? larguraPor(70, context),
      decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(color: colorBorder ?? Colors.white)),
      child: TextFormField(
        //onSubmitted: submited,
        validator: (value) {
          if (title == "Nascimento" && value != null) {
            if (value.length <= 4) {
              return "Formato de data incorreta!";
            }
          }
          return null;
        },
        obscureText: password ?? false,
        controller: controller,

        keyboardType: type,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            hintStyle: TextStyle(color: colorLetter ?? Colors.grey)),
        style: TextStyle(fontSize: 18, color: colorLetter ?? Colors.blue),
      ),
    );
  }
}
