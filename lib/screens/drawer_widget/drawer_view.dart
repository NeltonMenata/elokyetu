import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/home_controller.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/screens/chat/chat_view.dart';
import 'package:elokyetu/screens/users_views/found_user_view.dart';
import 'package:elokyetu/screens/users_views/proxy_user_view.dart';

class DraweView extends StatelessWidget {
  const DraweView({Key? key}) : super(key: key);
  HomeController get _controller => HomeController.controller;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: "Dados da Conta",
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 36,
                child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 33,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: const Icon(Icons.person_rounded))),
              ),
              accountName: Text("${LoginController.user != null ? "" : ""}"),
              accountEmail: Text("${LoginController.user != null ? "" : ""}")),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text("Procurar Usuários"),
            subtitle: const Text(
                "Encontre outros Usuários do EloKyetu! para partilha de publicações e outros!!"),
            trailing: const Icon(Icons.person_search_rounded),
            onTap: () {
              Get.to(ProxyUserView());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text("Ver usuários encontrados"),
            subtitle: const Text(
                "Vê todos os Usuários do EloKyetu! que podem partilhar informações com você!!"),
            trailing: const Icon(Icons.person_add_alt_1),
            onTap: () {
              Get.to(FoundUserView());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text("Chat Mensagens"),
            subtitle: const Text(
                "Bate papo com outros usuários que encontraste no Elokyeto!"),
            trailing: const Icon(Icons.message_rounded),
            onTap: () {
              Get.to(const ChatView());
            },
          ),
          const Spacer(),
          ListTile(
            title: const Text("Sair"),
            subtitle: const Text("Termine a sua sessão no EloKyeto!"),
            trailing: const Icon(Icons.logout_rounded),
            onTap: () {
              _controller.finishidSession(context);
            },
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
