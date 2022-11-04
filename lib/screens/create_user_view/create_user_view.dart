// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:elokyetu/screens/components_general_views/text_field_yetu.dart';
import 'package:elokyetu/ui/container_with_corner.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elokyetu/app/app_controller/create_user_controller.dart';
import 'package:elokyetu/util/size/size.dart';
import '../components_general_views/button_rounded_view.dart';
import '../components_general_views/textfield_rounded_view.dart';

class CreateUserView extends StatelessWidget {
  CreateUserController get _controller => CreateUserController.controller;

  final formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  final email = TextEditingController();
  final senha = TextEditingController();
  final datetime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: size.height,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: .6,
                  image: AssetImage(
                    "assets/img/fundo.png",
                  ),
                ),
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
              ),
            ),
            ContainerCorner(
              marginTop: size.width * 0.08,
              marginBottom: size.width * 0.04,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        ContainerCorner(
                          width: size.width * 0.15,
                          height: 40,
                          marginRight: size.width * 0.05,
                          imageDecoration: "assets/img/fundo_logo.png",
                        ),
                      ],
                    ),
                    Align(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.05,
                          right: size.width * 0.05,
                          bottom: size.width * 0.20,
                        ),
                        child: Text(
                          "Crie a sua conta e receberás o conforto do EloKyetu e compartilha com os amigos!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFieldRoundedView(
                      title: "Nome",
                      type: TextInputType.text,
                      controller: nome,
                      IsEmail: true,
                      width: larguraPor(85, context),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite o seu Nome";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldRoundedView(
                      title: "Email",
                      type: TextInputType.emailAddress,
                      controller: email,
                      width: larguraPor(85, context),
                      IsEmail: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite o seu Nome";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldRoundedView(
                      title: "Senha",
                      type: TextInputType.name,
                      password: true,
                      IsEmail: false,
                      controller: senha,
                      width: larguraPor(85, context),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite o seu Nome";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFieldRoundedView(
                      title: "Nascimento",
                      controller: datetime,
                      type: TextInputType.number,
                      IsEmail: false,
                      width: larguraPor(85, context),
                      validator: (value) {
                        if (datetime == "Nascimento" &&
                            value != null &&
                            value.length <= 4) {
                          return "Formato de data incorreta!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextWithTap(
                      "Exemplo: 17.03.1989",
                      color: Colors.grey,
                      alignment: Alignment.centerRight,
                      marginRight: size.width * 0.10,
                    ),
                    ContainerCorner(
                      marginTop: size.width * 0.15,
                      marginBottom: size.width * 0.04,
                      alignment: Alignment.center,
                      child: ButtonRoundedView(
                        title: "Criar Conta",
                        width: size.width * 0.90,
                        colorLetter: Colors.orange,
                        colorBackground: Colors.white,
                        action: () {
                          if (formKey.currentState!.validate()) {
                            _controller.createUser(
                              nome.text.trim(),
                              email.text.trim(),
                              senha.text.trim(),
                              datetime.text.trim(),
                              context,
                            );
                          }
                          /*
                                var confirm = formKey.currentState!.validate();
                                if (confirm) {
                                  print("Valor: $confirm");
                                  return;
                                }
                                */
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*  Container(
              width: double.infinity,
              height: Get.height,
              // decoration: BoxDecoration(
              //   color: Colors.black.withOpacity(0.4),
              //   image: DecorationImage(
              //       image: AssetImage(
              //         "assets/img/fundo.png",
              //       ),
              //       fit: BoxFit.cover),
              // ),
              child: Container(
                height: double.maxFinite,
                width: Get.height,
                color: Colors.black.withOpacity(0.15),
                // child: SingleChildScrollView(
                //   child: Form(
                //     key: formKey,
                //     child: Column(
                //       children: [
                //         // Row(
                //         //   children: [
                //         //     Align(
                //         //       alignment: Alignment.topLeft,
                //         //       child: IconButton(
                //         //         icon: Icon(
                //         //           Icons.arrow_back_ios,
                //         //           color: Colors.black,
                //         //         ),
                //         //         onPressed: () {
                //         //           Get.back();
                //         //         },
                //         //       ),
                //         //     ),
                //         //     // SizedBox(
                //         //     //   width: Get.width * 0.70,
                //         //     // ),
                //         //     Align(
                //         //       alignment: Alignment.topRight,
                //         //       child: ContainerCorner(
                //         //         width: 40,
                //         //         height: 40,
                //         //         marginRight: size.width * 0.15,
                //         //         imageDecoration: "assets/img/fundo_logo.png",
                //         //         // decoration: BoxDecoration(
                //         //         //   image: DecorationImage(
                //         //         //       image:
                //         //         //           AssetImage("assets/img/fundo_logo.png"),
                //         //         //       fit: BoxFit.fitHeight),
                //         //         //   // color: Colors.white,
                //         //         //   // borderRadius: BorderRadius.circular(20),
                //         //         // ),
                //         //       ),
                //         //     ),
                //         //   ],
                //         // ),

                //         //Spacer(),

                //         SizedBox(
                //           height: Get.height * 0.1,
                //         ),
                //         TextFieldRoundedView(
                //           title: "Nome",
                //           type: TextInputType.text,
                //           controller: nome,
                //           width: larguraPor(85, context),
                //           colorLetter: Colors.orangeAccent,
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         TextFieldRoundedView(
                //           title: "Email",
                //           type: TextInputType.emailAddress,
                //           controller: email,
                //           colorLetter: Colors.orangeAccent,
                //           width: larguraPor(85, context),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         TextFieldRoundedView(
                //           title: "Senha",
                //           type: TextInputType.name,
                //           password: true,
                //           controller: senha,
                //           colorLetter: Colors.orangeAccent,
                //           width: larguraPor(85, context),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         TextFieldRoundedView(
                //           title: "Nascimento",
                //           controller: datetime,
                //           type: TextInputType.number,
                //           colorLetter: Colors.orangeAccent,
                //           width: larguraPor(85, context),
                //         ),
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text("Exemplo: 17.03.1989"),

                //         ContainerCorner(
                //           marginTop: size.width * 0.15,
                //           marginBottom: size.width * 0.04,
                //           alignment: Alignment.center,
                //           child: ButtonRoundedView(
                //             title: "Criar Conta",
                //             width: size.width * 0.90,
                //             colorLetter: Colors.orange,
                //             colorBackground: Colors.white,
                //             action: () {
                //               /*
                //               var confirm = formKey.currentState!.validate();
                //               if (confirm) {
                //                 print("Valor: $confirm");
                //                 return;
                //               }
                //               */
                //               _controller.createUser(
                //                 nome.text.trim(),
                //                 email.text.trim(),
                //                 senha.text.trim(),
                //                 datetime.text.trim(),
                //                 context,
                //               );
                //             },
                //           ),
                //         ),
                //         //Spacer(),
                //       ],
                //     ),
                //   ),
                // ),
              ),
            ),
         */
          ],
        ),
      ),
    );
  }
}
