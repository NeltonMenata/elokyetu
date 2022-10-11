// ignore_for_file: deprecated_member_use, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/screens/chat/chat_view.dart';
import 'package:elokyetu/screens/bottom_bar/tabb_screen.dart';
import 'package:elokyetu/screens/users_views/controllers/user_controller.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PerfilUser extends StatelessWidget {
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "perfil do usuario".tr.capitalize!,
          style: TextStyle(
            fontFamily: "Times New Roman",
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FavoritsContacts(),
            SizedBox(
              height: 180,
              child: GetBuilder<UserController>(
                init: UserController(),
                builder: (_) {
                  if (controller.isUsersFound) {
                    return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.usersFound.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(ChatView(),
                                  arguments: controller.usersFound[index]);
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  child: LoginController.perfilImgFound(
                                      controller.usersFound[index]
                                          ["imgPerfil"]),
                                ),
                                Text(
                                  controller.usersFound[index]["nome"],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontFamily: "Times New Roman",
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10,
                          );
                        });
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
    );
  }
}

class FavoritsContacts extends StatelessWidget {
  var _userInformation = LoginController.userInformation;
  var _user = LoginController.user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(65),
                  child: LoginController.perfilImg()),
            ),
          ),
        ),
        Text(
          _userInformation!["nome"],
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          _user!["email"],
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14.0,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          height: 50,
          width: Get.width * 0.7,
          child: FlatButton.icon(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {
              Get.to(
                EditarPerfil(),
                fullscreenDialog: true, // abrir a tela como uma modal
              );
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60.0),
            ),
            label: Text(
              'Editar',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ListTile(
          minVerticalPadding: 0.0,
          title: Text(
            "SEGUIDORES ",
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
            ),
          ),
          subtitle: Text(
            "Encontrados",
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Times New Roman",
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}

class Especifico extends StatelessWidget {
  get index => null;
  var _userInformation = LoginController.userInformation as ParseObject;
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
          elevation: 1.0,
          centerTitle: true,
          title: Text(
            'Menu',
            style: TextStyle(
              fontFamily: "Times New Roman",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  width: 70,
                  height: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: LoginController.perfilImg(),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: Text(
                    _userInformation.get("nome"),
                    maxLines: 1, //,
                    style: TextStyle(
                      fontFamily: "Times New Roman",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(PerfilUser());
                    },
                    child: Text(
                      'Mostrar perfil',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Times New Roman",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
            Divider(
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 190),
              child: TextButton.icon(
                  onPressed: () {
                    Get.to(ChatView());
                  },
                  icon: Icon(Icons.message_outlined, color: Colors.blue),
                  label: Text(
                    'Conversas',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 209),
              child: TextButton.icon(
                  onPressed: () {
                    Get.to(ListAmigosScreens());
                  },
                  icon: Icon(Icons.group_outlined, color: Colors.blue),
                  label: Text(
                    'Amigos',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 180),
              child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.menu_book_sharp, color: Colors.blue),
                  label: Text(
                    'Publicações',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 200),
              child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.settings, color: Colors.blue),
                  label: Text(
                    'Definições',
                    style: TextStyle(color: Colors.blue),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class EditarPerfil extends StatefulWidget {
  bool isCreate = false;

  EditarPerfil({this.isCreate = false});

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  bool _edNome = false;
  bool _edPassatempo = false;
  bool _edProfissao = false;

  var _userInformation = LoginController.userInformation as ParseObject;

  final _controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.isCreate = true;
        widget.isCreate == true ? Get.offAll(TabsScreen()) : Get.back();

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              'Editar perfil',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (_) {
                    return Center(
                      child: _controller.isSavingEditPerfil == true
                          ? Container(
                              padding: const EdgeInsets.only(right: 10),
                              height: 25,
                              width: 35,
                              child:
                                  CircularProgressIndicator(color: Colors.blue))
                          : SizedBox(),
                    );
                  })
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (_) => Container(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        width: 70,
                        height: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(65.0),
                          child: _controller.imgFile != null
                              ? Image.file(
                                  _controller.imgFile!,
                                  fit: BoxFit.cover,
                                )
                              : LoginController.perfilImg(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Flexible(
                        child: Text(
                          _userInformation["nome"],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize:
                                  16), // aqui ainda continua o mesmo erro de overflow alterei o tamanho de letra
                        ),
                      ),
                    ),
                    // Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () async {
                            _controller.selectImgPerfil();
                            //Get.to(PerfilUser());
                            /// var result = await FilePicker.platform.pickFiles();
                          },
                          child: Text(
                            'Editar',
                            style: TextStyle(color: Colors.blue),
                          )),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.blue,
              ),
              SizedBox(
                width: double.infinity,
                child: ListTile(
                  title: Text(
                    'Nome',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  subtitle: _edNome == true
                      ? TextField(controller: _controller.edNome)
                      : Text(_userInformation["nome"].toString()),
                  leading:
                      Icon(Icons.send_and_archive_outlined, color: Colors.blue),
                  trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          _edNome = !_edNome;
                        });
                        //Get.to(PerfilUser()); // aqui alterar para modificar
                      },
                      child: Text(
                        'Editar',
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
              ),
              Divider(color: Colors.blue),
              SizedBox(
                width: double.infinity,
                child: ListTile(
                  title: Text(
                    'Passatempo',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  subtitle: _edPassatempo == true
                      ? TextField(
                          controller: _controller.edPassatempo,
                        )
                      : Text(_userInformation["passatempo"].toString()),
                  leading: Icon(
                    Icons.open_in_new,
                    color: Colors.blue,
                  ),
                  trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          _edPassatempo = !_edPassatempo;
                        });
                        //Get.to(PerfilUser()); // aqui alterar para modificar
                      },
                      child: Text(
                        'Editar',
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
              ),
              Divider(color: Colors.blue),
              SizedBox(
                width: double.infinity,
                child: ListTile(
                  title: Text(
                    'Profissão',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  subtitle: _edProfissao == true
                      ? TextField(
                          controller: _controller.edProfissao,
                        )
                      : Text(_userInformation["profissao"].toString()),
                  leading: Icon(
                    Icons.sentiment_very_satisfied_outlined,
                    color: Colors.blue,
                  ),
                  trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          _edProfissao = !_edProfissao;
                        });
                        //Get.to(PerfilUser()); // aqui alterar para modificar
                      },
                      child: Text(
                        'Editar',
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
              ),
              Divider(color: Colors.blue),
              SizedBox(height: 10),
              FlatButton.icon(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _controller.saveEditing(context);
                  });
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                label: Text(
                  'Guardar Modificações',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 5),
              FlatButton.icon(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Get.offAll(TabsScreen());
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60.0),
                ),
                label: Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListAmigosScreens extends StatelessWidget {
  final controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent[700],
        centerTitle: true,
        title: Text(
          'Lista de Amigos',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: GetBuilder<UserController>(
              init: UserController(),
              builder: (_) {
                if (controller.isUsersFound) {
                  return ListView.separated(
                    itemCount: controller.usersFound.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: LoginController.perfilImgFound(
                            controller.usersFound[index]["imgPerfil"]),
                        trailing: Icon(Icons.chat),
                        title: Text(controller.usersFound[index]["nome"]),
                        onTap: () {
                          Get.to(ChatView(),
                              arguments: controller.usersFound[index]);
                        },
                      );
                    },
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
    );
  }
}
