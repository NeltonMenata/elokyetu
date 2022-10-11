import 'package:flutter/material.dart';

import '../helpers/quick_help.dart';
import 'colors.dart';

class LoadingDialog extends Dialog {
  const LoadingDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: 70.0,
          height: 70.0,
          child: Container(
            decoration: ShapeDecoration(
              color: QuickHelp.isDarkMode(context) ? kContentColorLightTheme : kContentColorDarkTheme,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(
                  color: QuickHelp.isDarkMode(context) ? kContentColorDarkTheme : kPrimaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}