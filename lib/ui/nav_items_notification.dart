import 'package:flutter/material.dart';

class Component {
  static Widget buildNavIcon(
      IconData icon, int index, bool withBage, BuildContext context,
      {int badge = 0, int color = 0xFFFA3967}) {
    if (withBage) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: kBottomNavigationBarHeight,
        padding: const EdgeInsets.all(0.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Icon(
                          icon,
                          size: 30,

                          //currentColor: Colors.amber,
                        ),
                        Positioned(
                          right: -9,
                          top: 5,
                          child: Container(
                            padding: const EdgeInsets.only(top: 2.0),
                            height: 20,
                            width: 20,
                            constraints: const BoxConstraints(
                              maxHeight: 45,
                              maxWidth: 45,
                            ),
                            decoration: BoxDecoration(
                              color: Color(color),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white,
                                  width: 2.0,
                                  style: BorderStyle.solid),
                            ),
                            child: Center(
                              child: Text(
                                "$badge",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Icon(
        icon,
        size: 30,
      );
    }
  }
}
