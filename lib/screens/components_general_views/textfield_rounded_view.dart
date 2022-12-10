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
      this.validator,
      this.onChanged,
      this.IsContact,
      this.enabled,
      required this.IsEmail,
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

  bool IsEmail;
  bool? IsContact;
  final TextInputType? type;
  final Function(String value)? submited;
  String? Function(String?)? validator;
  Function? onChanged;
  bool? enabled;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      clipBehavior: Clip.antiAlias,
      height: size.width * 0.14,
      width: width ?? larguraPor(70, context),
      decoration: BoxDecoration(
        color: colorBackground,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          color: colorBorder ?? Colors.white,
        ),
      ),
      child: TextFormField(
        validator: validator,
        enabled: enabled,
        obscureText: password ?? false,
        onTap: () {
          if (onChanged != null) {
            onChanged!();
          }
        },
        controller: controller,
        keyboardType: IsEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: title,
            hintStyle: TextStyle(color: colorLetter ?? Colors.grey)),
        style: TextStyle(fontSize: 18, color: colorLetter ?? Colors.blue),
      ),
    );
  }
}
