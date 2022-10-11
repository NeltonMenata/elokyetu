// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/home_controller.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/screens/lista_usuarios/lista_usuarios_view.dart';
import 'package:elokyetu/util/app_routas.dart';

class MainDrawer extends StatelessWidget {
  final _controller = Get.put(HomeController());
  var _user = LoginController.user;
  var _userInformation = LoginController.userInformation;
  Widget _createItem(IconData icon, String label, dynamic onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 22,
      ),
      title: Text(label,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 16,
            fontWeight: FontWeight.normal,
          )),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: LoginController.perfilImg()),
            accountName: Text(_userInformation!["nome"]),
            accountEmail: Text(_user!["email"]),
          ),
          _createItem(
            Icons.message_outlined,
            'Conversas',
            () {},
          ),
          ListTile(
            leading: Icon(Icons.group_outlined),
            title: Text('Encontrados'),
            onTap: () {
              Get.to(ListUsuario());
            },
          ),
          ListTile(
            leading: Icon(Icons.maps_home_work_sharp),
            title: Text('Publicações'),
            onTap: () {
              // Get.to(HomePage());
            },
          ),
          _createItem(
            Icons.settings,
            'Definições',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
          _createItem(
            Icons.exit_to_app_rounded,
            'Terminar sessão',
            () => _controller.finishidSession(context),
            // Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
          Divider(),
        ],
      ),
    );
  }
}
