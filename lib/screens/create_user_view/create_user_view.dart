// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: Get.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/img/fundo.png",
              ),
              fit: BoxFit.cover),
        ),
        child: Container(
          height: double.maxFinite,
          width: Get.height,
          color: Colors.black.withOpacity(0.15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.orange,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.70,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/img/fundo_logo.png"),
                                fit: BoxFit.fitHeight),
                            // color: Colors.white,
                            // borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //Spacer(),
                  Text(
                    "Crie a sua conta e receberás o conforto do EloKyetu e compartilha com os amigos!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  TextFieldRoundedView(
                    title: "Nome",
                    type: TextInputType.text,
                    controller: nome,
                    width: larguraPor(85, context),
                    colorLetter: Colors.orangeAccent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRoundedView(
                    title: "Email",
                    type: TextInputType.emailAddress,
                    controller: email,
                    colorLetter: Colors.orangeAccent,
                    width: larguraPor(85, context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRoundedView(
                    title: "Senha",
                    type: TextInputType.name,
                    password: true,
                    controller: senha,
                    colorLetter: Colors.orangeAccent,
                    width: larguraPor(85, context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFieldRoundedView(
                    title: "Nascimento",
                    controller: datetime,
                    type: TextInputType.number,
                    colorLetter: Colors.orangeAccent,
                    width: larguraPor(85, context),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Exemplo: 17.03.1989"),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  ButtonRoundedView(
                    title: "Criar Conta",
                    action: () {
                      /*
                      var confirm = formKey.currentState!.validate();
                      if (confirm) {
                        print("Valor: $confirm");
                        return;
                      }
                      */
                      _controller.createUser(
                        nome.text.trim(),
                        email.text.trim(),
                        senha.text.trim(),
                        datetime.text.trim(),
                        context,
                      );
                    },
                  ),
                  //Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
