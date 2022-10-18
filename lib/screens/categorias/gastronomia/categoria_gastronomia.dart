// ignore_for_file: deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:elokyetu/models/gastronomia_model/post_gastronomia_model.dart';
import 'package:elokyetu/models/gastronomia_model/post_gastronomia_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:elokyetu/data/abel/post_json.dart';
import 'package:elokyetu/screens/categorias/gastronomia/post_categoria_controller.dart';
import 'package:elokyetu/screens/postagem/postagem.dart';
import 'package:elokyetu/theme/colors.dart';
import 'package:elokyetu/util/size/size.dart';
import 'package:video_player/video_player.dart';

import 'categories_screen.dart';
import 'childs/personal_chef.dart';

class CategoriasGastronomia extends StatefulWidget {
  @override
  _CategoriasGastronomiaState createState() => _CategoriasGastronomiaState();
}

class _CategoriasGastronomiaState extends State<CategoriasGastronomia> {
  @override
  void initState() {
    PostController.postController.initPost();
    super.initState();
  }

  //final _controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          centerTitle: false,
          title: Text(
            "gastronomia".tr.capitalize!,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Times New Roman',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                PostController.postController.loadNewsPost();
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ]),
      body: SingleChildScrollView(
        controller: PostController.postController.scrollPost,
        child: Column(
          children: [
            Container(
              height: 25,
              width: double.maxFinite,
              color: Colors.black87,
              alignment: Alignment.bottomLeft,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "gastronomia".tr.capitalize!,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Categorias',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Panificaco(),
            Container(
              height: 25,
              width: double.maxFinite,
              color: Colors.black87,
              alignment: Alignment.bottomLeft,
              child: Stack(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Sub-categorias",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Receitas",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PostWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PostController.postController.postUp();
        },
        child: Icon(Icons.arrow_upward_rounded),
      ),
    );
  }
}

class Panificaco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            width: larguraPor(45, context),
            height: larguraPor(40, context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Get.to(CategoriesScreen());
                  },
                  child: Image.asset(
                    'assets/imag/mae.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.blueGrey.withOpacity(0.8),
                  title: Text(
                    "Panificação",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Times New Roman',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
          ),
          SizedBox(
            width: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: larguraPor(45, context),
                height: larguraPor(40, context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(CategoriesScreen());
                      },
                      child: Image.asset(
                        'assets/imag/cozinha.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.blueGrey.withOpacity(0.8),
                      title: Text(
                        "Cozinha criativa",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Times New Roman',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Container(
                width: larguraPor(45, context),
                height: larguraPor(40, context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(PersonalChef());
                      },
                      child: Image.asset(
                        'assets/imag/personal.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.blueGrey,
                      title: Text(
                        "Personal Chef",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Times New Roman',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
              ),
              SizedBox(
                width: 1,
              ),
              Container(
                width: larguraPor(45, context),
                height: larguraPor(40, context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GridTile(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(CategoriasGastronomia());
                      },
                      child: Image.asset(
                        'assets/imag/personal.jpg',
                        // 'assetsimag/segura.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    footer: GridTileBar(
                      backgroundColor: Colors.blueGrey.withOpacity(0.8),
                      title: Text(
                        "Segurança Alimentar",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget getBody() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 25,
              width: double.maxFinite,
              color: Colors.black87,
              alignment: Alignment.bottomLeft,
              child: Text(
                "   Sub-categorias                                     Receitas",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                height: 50,
                width: double.infinity,
                child: FlatButton(
                  onPressed: () {
                    Get.to(
                      PostPage(),
                      fullscreenDialog: true, // abrir a tela como uma modal
                    );
                  },
                  color: Colors.black.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Text(
                    'Novas Publicação',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87.withOpacity(0.4),
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: List.generate(postsList.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 25, top: 20),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 288,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.4),
                          spreadRadius: 2,
                          blurRadius: 15,
                          offset: Offset(0, 1),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                          postsList[index]['postImg']
                              .toString(), //postar segunda imagen
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 288,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: black.withOpacity(0.25),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 288,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      postsList[index]['img']
                                          .toString(), //imagem do bk
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        postsList[index]
                                            ['name'], // nome do usuario
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        postsList[index]
                                            ['time'], // hora que foi postado
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: white.withOpacity(0.8)),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 70,
                                height: 27,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27),
                                    color: Color(0xFFE5E5E5).withOpacity(0.5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.star_outline,
                                      color: white,
                                      size: 14,
                                    ),
                                    Text(
                                      postsList[index]['like'],
                                      style:
                                          TextStyle(fontSize: 13, color: white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 27,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27),
                                    color: Color(0xFFE5E5E5).withOpacity(0.5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.chat_bubble_outline,
                                      color: white,
                                      size: 14,
                                    ),
                                    Text(
                                      postsList[index]['comment'],
                                      style:
                                          TextStyle(fontSize: 13, color: white),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 70,
                                height: 27,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27),
                                    color: Color(0xFFE5E5E5).withOpacity(0.5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: white,
                                      size: 14,
                                    ),
                                    Text(
                                      postsList[index]['share'],
                                      style:
                                          TextStyle(fontSize: 13, color: white),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    ),
  );
}

class PostWidget extends StatelessWidget {
  final _controller = PostController.postController;
  String videoSource = "";
  final videoController = VideoPlayerController.network("videoSource");

  @override
  Widget build(BuildContext context) {
    print("#######################################");
    print(PostController.isLoadPost.value);
    return Obx(() {
      return PostController.isLoadPost.value != true
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: _controller.posts.length,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                return PostGastronomiaWidget(_controller.posts[index]);
              },
            )
          : Center(child: CircularProgressIndicator());
    });
  }
}
