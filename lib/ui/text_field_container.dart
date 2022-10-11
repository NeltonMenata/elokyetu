import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  final bool? visible;

  const TextFieldContainer({
    Key? key,
    this.child,
    this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: visible ?? true,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ));
  }
}
