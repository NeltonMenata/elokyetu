// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/screens/components_general_views/button_rounded_view.dart';
import 'package:elokyetu/screens/components_general_views/textfield_rounded_view.dart';
import 'package:elokyetu/screens/create_user_view/create_user_view.dart';
import 'package:elokyetu/screens/welcome_view/welcome_view.dart';
import 'package:elokyetu/util/size/size.dart';

class LoginView extends StatelessWidget {
  final controller = Get.put(LoginController());

  final email = TextEditingController();
  final senha = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(WelcomeView());
        return false;
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Container(
            height: size.height,
            decoration: const BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.7,
                image: AssetImage(
                  "assets/img/fundo_login.png",
                ),
              ),
            ),
            child: Container(
              height: Get.height,
              width: double.infinity,
              color: Colors.black.withOpacity(0.25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                        SizedBox(width: Get.width * 0.70),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/img/fundo_logo.png"),
                                  fit: BoxFit.fitHeight),
                              // color: Colors.white,
                              // borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 85,
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: SizedBox(
                              // width: 200.0,
                              child: DefaultTextStyle(
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'Bobbers',
                                ),
                                child: AnimatedTextKit(
                                  repeatForever: true,
                                  animatedTexts: [
                                    TyperAnimatedText('Nossa Ligação'),
                                    TyperAnimatedText('Nosso Link'),
                                    TyperAnimatedText('Nossa União'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Faça o seu Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFieldRoundedView(
                      title: "Email",
                      controller: email,
                      IsEmail: true,
                      width: larguraPor(85, context),
                      type: TextInputType.emailAddress,
                      colorLetter: Colors.orangeAccent,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite o seu Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldRoundedView(
                      title: "Senha",
                      width: larguraPor(85, context),
                      controller: senha,
                      password: true,
                      IsEmail: false,
                      colorLetter: Colors.orangeAccent,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite o seu Senha";
                        }
                        return null;
                      },
                    ),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: larguraPor(14, context)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Esqueceu a senha?"),
                      ),
                    ),
                    ButtonRoundedView(
                      title: "Entrar",
                      action: () {
                        if (formKey.currentState!.validate()) {
                          controller.login(email.text, senha.text, context);
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(CreateUserView());
                      },
                      child: Text("NÃO TEM CONTA? CRIE AGORA"),
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
