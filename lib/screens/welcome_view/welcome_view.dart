// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:elokyetu/screens/components_general_views/button_rounded_view.dart';
import 'package:elokyetu/screens/create_user_view/create_user_view.dart';
import 'package:elokyetu/screens/login_view/login_view.dart';
import 'package:elokyetu/ui/container_with_corner.dart';

class WelcomeView extends StatelessWidget {
  static const colorizeColors = [
    Colors.white,
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.green,
  ];
  var colorizeTextStyle = TextStyle(
    fontSize: 40.0,
    fontFamily: 'Horizon',
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/fundo.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fitHeight,
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Spacer(),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          child: AnimatedTextKit(
                            pause: const Duration(milliseconds: 1000),
                            repeatForever: true,
                            animatedTexts: [
                              ColorizeAnimatedText(
                                "ELOKYETU",
                                textStyle: colorizeTextStyle,
                                colors: colorizeColors,
                              ),
                            ],
                            isRepeatingAnimation:
                                true, // Nossa ligação, Nosso link , Nossa União
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: SizedBox(
                              // width: 200.0,
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 20.0,
                                  // fontFamily: 'Bobbers',
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TyperAnimatedText(
                                      'Nossa Ligação',
                                      textStyle:
                                          TextStyle(color: Colors.yellowAccent),
                                    ),
                                    TyperAnimatedText(
                                      'Nosso Link',
                                      textStyle:
                                          TextStyle(color: Colors.orangeAccent),
                                    ),
                                    TyperAnimatedText(
                                      'Nossa União',
                                      textStyle:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Text(
                  //   "Nossa",
                  //   style: TextStyle(fontSize: 20.0),
                  // ),
                  // // SizedBox(width: 20.0, height: 30.0),
                  // DefaultTextStyle(
                  //   style: TextStyle(
                  //     fontSize: 20.0,
                  //     fontFamily: 'Horizon',
                  //   ),
                  //   child:
                  //       AnimatedTextKit(repeatForever: true, animatedTexts: [
                  //     RotateAnimatedText('Ligação'),
                  //     RotateAnimatedText('União'),
                  //     RotateAnimatedText('Link'),
                  //   ]),
                  // ),

                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Olá seja bem-vindo",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ContainerCorner(
                    marginTop: size.width * 0.28,
                    marginBottom: size.width * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: Colors.white)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: Colors.white)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: Colors.white)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: Colors.white)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: Colors.white)),
                        )
                      ],
                    ),
                  ),

                  ContainerCorner(
                    marginTop: size.width * 0.26,
                    marginBottom: size.width * 0.04,
                    alignment: Alignment.center,
                    child: ButtonRoundedView(
                      title: "EXPLORAR",
                      width: size.width * 0.90,
                      colorLetter: Colors.orange,
                      colorBackground: Colors.white,
                      action: () {
                        Get.to(CreateUserView());
                      },
                    ),
                  ),

                  ContainerCorner(
                    marginBottom: size.width * 0.14,
                    alignment: Alignment.center,
                    child: ButtonRoundedView(
                      title: "LOGIN",
                      width: size.width * 0.90,
                      action: () {
                        Get.to(LoginView(),
                            transition: Transition.fadeIn,
                            curve: Curves.easeIn);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
