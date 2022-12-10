// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:elokyetu/ui/container_with_corner.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:elokyetu/app/app_controller/create_user_controller.dart';
import 'package:elokyetu/util/size/size.dart';
import '../components_general_views/button_rounded_view.dart';
import '../components_general_views/textfield_rounded_view.dart';
import '../welcome_view/welcome_view.dart';

class CreateUserView extends StatefulWidget {
  @override
  State<CreateUserView> createState() => _CreateUserViewState();
}

class _CreateUserViewState extends State<CreateUserView> {
  CreateUserController get _controller => CreateUserController.controller;

  final formKey = GlobalKey<FormState>();

  final nome = TextEditingController();

  final email = TextEditingController();

  final senha = TextEditingController();

  final datetime = TextEditingController();
  DateTime? date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(WelcomeView());
        return false;
      },
      child: SafeArea(
        child: Form(
          key: formKey,
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.only(top: 20),
              height: Get.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: 0.7,
                  image: AssetImage(
                    "assets/img/fundo.png",
                  ),
                ),
              ),
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
                    GestureDetector(
                      onTap: () async {
                        date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.utc(1952),
                            lastDate: DateTime.utc(2030));
                        date ??= DateTime.now();
                        datetime.text =
                            "${date?.day}/${date?.month}/${date?.year}";
                        setState(() {});
                      },
                      child: TextFieldRoundedView(
                        enabled: false,
                        title: "Nascimento",
                        controller: datetime,
                        type: TextInputType.number,
                        IsEmail: false,
                        width: larguraPor(85, context),
                        validator: (value) {
                          if (datetime.text == "Nascimento" &&
                              value != null &&
                              value.length <= 4) {
                            return "Formato de data incorreta!";
                          }
                          return null;
                        },
                      ),
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
                            Get.snackbar("Criando conta", "Por favor aguarde!");
                            _controller.createUser(
                              nome.text.trim(),
                              email.text.trim(),
                              senha.text.trim(),
                              date!,
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
          ),
        ),
      ),
    );
  }
}
