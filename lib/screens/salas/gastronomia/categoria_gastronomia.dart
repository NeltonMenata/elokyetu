// ignore_for_file: deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:elokyetu/helpers/quick_help.dart';
import 'package:elokyetu/models/gastronomia_model/post_gastronomia_widget.dart';
import 'package:elokyetu/ui/container_with_corner.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:elokyetu/screens/salas/gastronomia/post_gastronomy_controller.dart';
import 'package:video_player/video_player.dart';

import 'categories_screen.dart';
import 'category/personal_chef.dart';

class CategoriasGastronomia extends StatefulWidget {
  @override
  _CategoriasGastronomiaState createState() => _CategoriasGastronomiaState();
}

class _CategoriasGastronomiaState extends State<CategoriasGastronomia> {
  @override
  void initState() {
    //PostController.postController.initPost();
    super.initState();
  }

  List<String> text = [
    "Panificação",
    "Cozinha criativa",
    "Personal Chef",
  ];
  List<String> image = [
    'assets/imag/mae.jpg',
    'assets/imag/cozinha.png',
    'assets/imag/personal.jpg',
  ];
  var onTap = [
    CategoriesScreen(),
    CategoriesScreen(),
    PersonalChef(),
  ];
  //final _controller = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        elevation: .0,
        centerTitle: true,
        title: Row(
          children: [
            Text(
              "gastronomia".tr.capitalize!,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            TextButton(
              child: Text(
                "New Posts",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                PostGastronomyController.postController.loadNewsPost();
              },
            )
          ],
        ),
        /*
          actions: [
            IconButton(
              onPressed: () {
                PostController.postController.loadNewsPost();
              },
              icon: const Text("New Posts"),
            ),
          ]*/
      ),
      body: SingleChildScrollView(
        controller: PostGastronomyController.postController.scrollPost,
        child: Column(
          children: [
            ContainerCorner(
              color: Colors.black,
              height: size.width * 0.6,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextWithTap(
                      "Gastronomia",
                      color: Colors.white,
                      marginTop: size.width * 0.02,
                      marginLeft: size.width * 0.04,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextWithTap(
                      "Categorias",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.08,
                      marginLeft: size.width * 0.08,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        3,
                        (index) => categorias(
                          text: text[index],
                          image: image[index],
                          onTap: onTap[index],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextWithTap(
                      "sub-categorias",
                      color: Colors.white,
                      marginTop: size.width * 0.02,
                      marginLeft: size.width * 0.04,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextWithTap(
                      "Receitas",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.08,
                      marginLeft: size.width * 0.08,
                    ),
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
          PostGastronomyController.postController.postUp();
        },
        child: Icon(
          Icons.arrow_upward_rounded,
          color: Colors.black,
        ),
        backgroundColor: Colors.white.withOpacity(.9),
      ),
    );
  }

  Widget categorias({
    String? text,
    image,
    required Widget onTap,
  }) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ContainerCorner(
            width: size.width * 0.40,
            height: size.width * 0.35,
            marginTop: size.width * 0.11,
            marginBottom: size.width * 0.11,
            marginLeft: size.width * 0.03,
            borderRadius: 20,
            color: Colors.red,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GridTile(
                child: InkWell(
                  onTap: () => QuickHelp.goToNavigatorScreen(context, onTap),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: SizedBox(
                  height: size.width * 0.10,
                  child: GridTileBar(
                    backgroundColor: Colors.blueGrey.withOpacity(0.8),
                    title: Text(
                      text!,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  get _controller => PostGastronomyController.postController;
  String videoSource = "";
  final videoController = VideoPlayerController.network("videoSource");

  @override
  Widget build(BuildContext context) {
    print("#######################################");
    print(PostGastronomyController.postController.isLoadPost);
    return GetBuilder<PostGastronomyController>(
        init: PostGastronomyController(),
        builder: (_) {
          //WidgetsFlutterBinding.ensureInitialized();
          return PostGastronomyController.postController.isLoadPost != true
              ? ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
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
