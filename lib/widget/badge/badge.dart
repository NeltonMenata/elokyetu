import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final Widget child;
  final String value;
  final Color? color;

  Badge({
    required this.child,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // ignore: unnecessary_null_comparison, deprecated_member_use
              color: color != null ? color : Theme.of(context).accentColor,
            ),
            constraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        )
      ],
    );
  }
}
