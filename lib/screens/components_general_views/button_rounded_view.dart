import 'package:flutter/material.dart';
import 'package:elokyetu/util/size/size.dart';

// ignore: must_be_immutable
class ButtonRoundedView extends StatelessWidget {
  ButtonRoundedView(
      {required this.title,
      this.colorLetter,
      this.colorBackground,
      this.fontWeight,
      this.sizeLetter,
      required this.action,
      this.icon,
      this.height,
      this.width});

  final String title;
  final double? sizeLetter;
  final Color? colorLetter;
  final FontWeight? fontWeight;
  final Color? colorBackground;
  final double? height;
  final double? width;
  final Widget? icon;
  Function action;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: height ?? 45,
      width: width ?? larguraPor(70, context),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(45)),
      child: ElevatedButton(
        style: ButtonStyle(
            overlayColor: colorBackground == Colors.white
                ? MaterialStateProperty.all(Colors.blue.withOpacity(0.1))
                : null,
            backgroundColor:
                MaterialStateProperty.all(colorBackground ?? Colors.orange)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: colorLetter ?? Colors.white,
                  fontSize: sizeLetter ?? 20,
                  fontWeight: fontWeight ?? FontWeight.w300),
            ),
            const SizedBox(
              width: 10,
            ),
            icon ?? Container()
          ],
        ),
        onPressed: () {
          action();
        },
      ),
    );
  }
}
