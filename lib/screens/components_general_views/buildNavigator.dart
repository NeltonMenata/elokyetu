import 'package:elokyetu/helpers/quick_help.dart';
import 'package:elokyetu/screens/chat/chat_view.dart';
import 'package:elokyetu/screens/lista_usuarios/lista_usuarios_view.dart';
import 'package:elokyetu/screens/perfil_user/perfil_user.dart';
import 'package:flutter/material.dart';

Widget buildNavigator(BuildContext context) => SizedBox(
      height: 60,
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => QuickHelp.goBackToPreviousPage(context),
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () => QuickHelp.goToNavigatorScreen(
                context,
                const ChatView(),
              ),
              icon: const Icon(Icons.message_outlined),
            ),
            IconButton(
              onPressed: () => QuickHelp.goToNavigatorScreen(
                context,
                ListUsuario(),
              ),
              icon: const Icon(Icons.search_outlined),
            ),
            IconButton(
              onPressed: () => QuickHelp.goToNavigatorScreen(
                context,
                Especifico(),
              ),
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
      ),
    );
