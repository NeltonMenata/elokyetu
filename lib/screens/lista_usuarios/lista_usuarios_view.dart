// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/screens/users_views/controllers/user_controller.dart';
import 'package:elokyetu/theme/colors.dart';

class ListUsuario extends StatefulWidget {
  @override
  _ListUsuarioState createState() => _ListUsuarioState();
}

class _ListUsuarioState extends State<ListUsuario> {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Pesquisar Amigos',
            style: TextStyle(
              fontFamily: "Times New Roman",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: Get.width * 0.92,
                  height: 48,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 15,
                            offset: Offset(0, 1))
                      ]),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            color: black,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        child: TextField(
                          cursorColor: black,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Encontre aqui o seu amigo",
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GetBuilder<UserController>(
                  init: UserController(),
                  builder: (_) {
                    if (controller.isUsersProxy == true) {
                      return ListView.separated(
                        itemCount: controller.usersProxy.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            controller.usersProxy[index]["nome"].toString(),
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          leading: LoginController.perfilImgFound(
                              controller.usersProxy[index]["imgPerfil"]),
                          trailing: Icon(Icons.person_add_alt),
                          onTap: () {
                            controller.addUser(
                                controller.usersProxy[index].get("objectId"),
                                controller.usersProxy[index]);
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
