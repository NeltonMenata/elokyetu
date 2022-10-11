import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/home_controller.dart';
import 'package:elokyetu/components/main_drawer.dart';
import 'package:elokyetu/screens/chat/chat_view.dart';
import '../home/home.dart';
import '../lista_usuarios/lista_usuarios_view.dart';
import '../perfil_user/perfil_user.dart';
// import '../pages/perfil_vview.dart';

class TabsScreen extends StatefulWidget {
  final _controller = Get.put(HomeController());
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectdScreeIndex = 0;
  late final List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'ELOKYETU',
        'screen': HomePage(),
      },
      {
        'title': 'Mensagens',
        'screen': ChatView(),
      },
      {
        'title': 'Pesquiar Membros',
        'screen': ListUsuario(),
      },
      {
        'title': 'Perfirl de Usuário',
        'screen': Especifico(),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectdScreeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: _screens[_selectdScreeIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,

        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: _selectdScreeIndex,
        type: BottomNavigationBarType.shifting, // animação com os botões
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              label: 'Home'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.message_outlined),
              // ignore: deprecated_member_use
              label: 'Mensagens'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.search_outlined),
              // ignore: deprecated_member_use
              label: 'Pesquisar'),
          BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              label: 'Perfil'),
        ],
      ),
    );
  }
}
