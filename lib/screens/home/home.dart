// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:elokyetu/app/app_controller/home_controller.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/components/main_drawer.dart';
import 'package:elokyetu/screens/categorias/arte/arte_page.dart';
import 'package:elokyetu/screens/categorias/musica/musica_view/musica_view.dart';
import 'package:elokyetu/screens/postagem/postagem.dart';
import 'package:elokyetu/theme/colors.dart';
import 'package:elokyetu/util/size/size.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../categorias/gastronomia/categoria_gastronomia.dart';

class HomePage extends StatefulWidget {
  HomeController get _controller => HomeController.controller;

  @override
  _HomePageState createState() => _HomePageState();
}

// final List carregarProdutos = DUMMY_PRODUCTS;

class _HomePageState extends State<HomePage> {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: primaryLight,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Container(
              width: 109,
              height: 50,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/imag/logo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () async {
                  final text = await ParseCloudFunction("hello").execute();
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Teste"),
                            content: Text("${text.result}"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          ));
                },
                icon: Icon(Icons.read_more)),
            IconButton(
                onPressed: () {
                  Get.to(PostPage());
                },
                icon: Icon(Icons.post_add_outlined)),
            PopupMenuButton(itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("Português"),
                  onTap: () async {
                    await GetStorage().write("language", 1);
                    Get.updateLocale(Locale("pt", "PT"));
                  },
                ),
                PopupMenuItem(
                  child: Text("English"),
                  onTap: () async {
                    await GetStorage().write("language", 2);
                    Get.updateLocale(Locale("en", "US"));
                  },
                ),
                PopupMenuItem(
                  child: Text("French"),
                  onTap: () async {
                    await GetStorage().write("language", 3);
                    Get.updateLocale(Locale("fr", "FR"));
                  },
                ),
              ];
            }),
          ],
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              Grid2Menu(
                url1: 'assets/categoria/gastro.png',
                name1: "gastronomia",
                color1: Colors.blue,
                action1: () {
                  Get.to(CategoriasGastronomia());
                },
                url2: 'assets/categoria/saude.jpg',
                name2: "saúde",
                color2: Colors.green,
                action2: () {},
              ),
              SizedBox(height: 8),
              Grid2Menu(
                url1: 'assets/categoria/arte.jpg',
                name1: "arte",
                color1: Colors.orange,
                action1: () {
                  Get.to(ArteView());
                },
                url2: 'assets/categoria/estilo.png',
                name2: "vida e estilo",
                color2: Colors.red,
                action2: () {},
              ),
              SizedBox(height: 8),
              Grid2Menu(
                url1: 'assets/categoria/music-logo.jpg',
                name1: "música",
                color1: Colors.yellow,
                action1: () {
                  print("Você clicou na aba musica");
                  Get.to(MusicaView());
                },
                url2: 'assets/categoria/diverso.png',
                name2: "diversos",
                color2: Colors.teal,
                action2: () {},
              ),
              ListTile(
                title: Text(
                  "10Take",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "Mais Destacadas...",
                  //  com mais destaque no ramo da sua vida Partilha a sua historia. deixe o mundo perto de te.
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // PostWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class Grid2Menu extends StatelessWidget {
  const Grid2Menu({
    Key? key,
    required this.url1,
    required this.url2,
    required this.name1,
    required this.name2,
    required this.color1,
    required this.color2,
    required this.action1,
    required this.action2,
  }) : super(key: key);

  final String url1;
  final String url2;
  final String name1;
  final String name2;
  final Color color1;
  final Color color2;
  final Function action1;
  final Function action2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: larguraPor(48, context),
          height: larguraPor(45, context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  action1();
                },
                child: Image.asset(
                  url1,
                  fit: BoxFit.fill,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: color1,
                title: Text(
                  name1.tr.capitalize!,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: larguraPor(48, context),
          height: larguraPor(45, context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  action2();
                },
                child: Image.asset(
                  url2,
                  fit: BoxFit.fitHeight,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: color2,
                title: Text(
                  name2.tr.capitalize!,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
