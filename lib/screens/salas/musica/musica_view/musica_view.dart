import 'package:elokyetu/screens/components_general_views/button_rounded_view.dart';
import 'package:elokyetu/ui/container_with_corner.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:elokyetu/util/size/size.dart';
import 'package:elokyetu/widget/post_arte/post_arte.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/generated/i18n.dart';

class MusicaView extends StatefulWidget {
  @override
  State<MusicaView> createState() => _MusicaViewState();
}

class _MusicaViewState extends State<MusicaView> {
  final scrollController = ScrollController();
  List<String> text = [
    "Kuduro",
    "Rap",
    "Kizomba",
    "Semba",
  ];

  List<String> image = [
    "assets/img/fundo_login.png",
    'assets/img/fundo_logo.png',
    'assets/categoria/music-logo.jpg',
    'assets/imag/personal.jpg',
  ];

  var onTap = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: .0,
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        title: TextWithTap(
          "Música",
          fontWeight: FontWeight.bold,
          fontSize: size.width * 0.07,
          overflow: TextOverflow.clip,
        ),
        actions: const [
          Icon(Icons.music_video_outlined),
        ],
      ),
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: .3,
            image: AssetImage(
              "assets/img/fundo_login.png",
            ),
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextWithTap(
                "Es Produtor Musical? Cadastra-se Aqui",
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.04,
                marginTop: size.width * 0.05,
                overflow: TextOverflow.clip,
                color: Colors.grey,
              ),
              ButtonRoundedView(
                title: "Cadastrar",
                colorLetter: Colors.black,
                action: () {},
                fontWeight: FontWeight.bold,
                width: size.width * 0.9,
                marginTop: size.width * 0.03,
                colorBackground: Colors.yellow,
              ),
              ContainerCorner(
                marginTop: size.width * 0.04,
                color: Colors.grey.withOpacity(.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextWithTap(
                      "Musica mais Ouvida",
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05,
                      overflow: TextOverflow.clip,
                      color: Colors.black,
                    ),
                    TextWithTap(
                      "Mês",
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.07,
                      overflow: TextOverflow.clip,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              ContainerCorner(
                height: size.width * 0.5,
                // color: Colors.deepPurpleAccent,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.03,
                            right: size.width * 0.03,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                // marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.03,
                            right: size.width * 0.03,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                // marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ContainerCorner(
                // marginTop: size.width * 0.04,
                width: size.width,
                color: Colors.orange.withOpacity(.2),
                child: TextWithTap(
                  "Ver  todas as Musicas",
                  alignment: Alignment.center,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                  overflow: TextOverflow.clip,
                  color: Colors.black,
                ),
              ),
              ContainerCorner(
                marginTop: size.width * 0.04,
                color: Colors.grey.withOpacity(.4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextWithTap(
                      "Musica mais Ouvida",
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.05,
                      overflow: TextOverflow.clip,
                      color: Colors.black,
                    ),
                    TextWithTap(
                      "ANO",
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.07,
                      overflow: TextOverflow.clip,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              ContainerCorner(
                height: size.width * 0.5,
                // color: Colors.deepPurpleAccent,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.03,
                            right: size.width * 0.03,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                // marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.03,
                            right: size.width * 0.03,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ContainerCorner(
                                width: size.width * 0.3,
                                height: size.width * 0.2,
                                // marginTop: size.width * 0.03,
                                borderColor: Colors.yellow,
                                borderRadius: 10,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: GridTile(
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/img/fundo_login.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    footer: SizedBox(
                                      height: size.width * 0.05,
                                      child: GridTileBar(
                                        backgroundColor: Colors.yellow,
                                        title: TextWithTap(
                                          " Kuduro",
                                          fontSize: size.width * 0.03,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              ContainerCorner(
                                marginLeft: size.width * 0.02,
                                // color: Colors.yellow,
                                width: size.width * 0.33,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWithTap(
                                      " Artista: Os Lambas Demonio do Sambizanga",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    TextWithTap(
                                      " Titulo: Tá vir Comboio aumenta",
                                      fontSize: size.width * 0.03,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerCorner(
                                      // color: Colors.yellow,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.play_arrow,
                                            size: size.width * 0.03,
                                          ),
                                          TextWithTap(
                                            " 4.7M  0:30 1m",
                                            fontSize: size.width * 0.03,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ContainerCorner(
                // marginTop: size.width * 0.04,
                width: size.width,
                color: Colors.orange.withOpacity(.2),
                child: TextWithTap(
                  "Ver  todas as Musicas",
                  alignment: Alignment.center,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.04,
                  overflow: TextOverflow.clip,
                  color: Colors.black,
                ),
              ),
              ButtonRoundedView(
                title: "GENERO",
                colorLetter: Colors.black,
                marginTop: size.width * 0.05,
                action: () {},
                icon: Icon(Icons.library_music_outlined),
                fontWeight: FontWeight.bold,
                width: size.width * 0.9,
                colorBackground: Colors.yellow,
              ),
              ContainerCorner(
                height: size.width * 0.5,
                // color: Colors.deepPurpleAccent,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    4,
                    (index) => genero(
                      text: text[index],
                      image: image[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget genero({String? image, text}) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ContainerCorner(
            width: size.width * 0.3,
            height: size.width * 0.2,
            marginTop: size.width * 0.03,
            borderColor: Colors.yellow,
            // imageDecoration: "assets/img/fundo_login.png",
            borderRadius: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    image!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
        TextWithTap(
          text,
          fontSize: size.width * 0.03,
          color: Colors.black,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
