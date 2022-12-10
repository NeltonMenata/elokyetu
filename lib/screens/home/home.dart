// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_element
import 'package:elokyetu/screens/salas/arquitetura/arquitetura_screen.dart';
import 'package:elokyetu/screens/salas/gastronomia/post_gastronomy_controller.dart';
import 'package:elokyetu/util/size/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:elokyetu/app/app_controller/home_controller.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/components/main_drawer.dart';
import 'package:elokyetu/screens/salas/arte/arte_page.dart';
import 'package:elokyetu/screens/salas/musica/musica_view/musica_view.dart';
import 'package:elokyetu/theme/colors.dart';
import '../salas/gastronomia/categoria_gastronomia.dart';

class HomePage extends StatefulWidget {
  HomeController get _controller => HomeController.controller;

  @override
  _HomePageState createState() => _HomePageState();
}

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
            //mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.black,
                width: Get.width,
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Grid2Menu(
                        url1: 'assets/categoria/gastro.png',
                        name1: "gastronomia",
                        color1: Colors.blue,
                        action1: () {
                          setState(() {});
                          Get.to(CategoriasGastronomia());
                        },
                      ),
                      const SizedBox(width: 10),
                      Grid2Menu(
                        url1: 'assets/categoria/saude.jpg',
                        name1: "saúde",
                        color1: Colors.green,
                        action1: () {
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 10),
                      Grid2Menu(
                        url1: 'assets/categoria/arte.jpg',
                        name1: "arte",
                        color1: Colors.orange,
                        action1: () {
                          setState(() {});
                          Get.to(() => ArteView());
                        },
                      ),
                      const SizedBox(width: 10),
                      Grid2Menu(
                        url1: 'assets/categoria/estilo.png',
                        name1: "vida e estilo",
                        color1: Colors.red,
                        action1: () {
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 10),
                      Grid2Menu(
                        url1: 'assets/categoria/music-logo.jpg',
                        name1: "EloTV",
                        color1: Colors.yellow,
                        action1: () {
                          setState(() {});
                          print("Você clicou na aba musica");
                          Get.to(() => MusicaView());
                        },
                      ),
                      const SizedBox(width: 10),
                      Grid2Menu(
                        url1: 'assets/categoria/diverso.png',
                        name1: "Arquitetura",
                        color1: Colors.teal,
                        action1: () {
                          setState(() {});
                          Get.to(() => ArquiteturaScreen());
                        },
                      )
                    ],
                  ),
                ),
              ),
              PostWidget(),
              SizedBox(
                height: Get.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    //Carrega os primeiros posts da sala gastronomia
    PostGastronomyController.postController.initPost();

    super.initState();
  }
}

class Grid2Menu extends StatelessWidget {
  const Grid2Menu({
    Key? key,
    required this.url1,
    required this.name1,
    required this.color1,
    required this.action1,
  }) : super(key: key);

  final String url1;

  final String name1;

  final Color color1;

  final Function action1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        action1();
      },
      child: Column(
        children: [
          CircleAvatar(
              radius: larguraPor(10, context),
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                  radius: larguraPor(9, context),
                  backgroundImage: AssetImage(url1))),
          Text(name1.tr.capitalize!,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17))
        ],
      ),
    );
  }
}
