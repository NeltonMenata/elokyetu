import 'package:flutter/material.dart';

class TextFieldYetu extends StatelessWidget {
  final String hintText;
  bool isPassword;
  bool IsEmail;
  bool IsContact;
  TextEditingController controller;
  String? Function(String?)? validator;

  TextFieldYetu({
    Key? key,
    required this.hintText,
    required this.isPassword,
    required this.IsEmail,
    required this.IsContact,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    );
    return Container(
      height: size.width / 8,
      width: size.width / 1.20,
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        right: size.width / 30,
        left: size.width / 30,
      ),
      decoration: BoxDecoration(
        // color: colorBackground,
        borderRadius: BorderRadius.circular(45),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: TextFormField(
        validator: validator!,
        controller: controller,
        style: const TextStyle(color: Colors.black),
        obscureText: isPassword,
        keyboardType: IsEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          border: InputBorder.none,
          // border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8),
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
