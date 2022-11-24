import 'package:elokyetu/helpers/quick_help.dart';
import 'package:elokyetu/screens/salas/gastronomia/categories_screen.dart';
import 'package:elokyetu/screens/salas/gastronomia/category/personal_chef.dart';
import 'package:elokyetu/screens/components_general_views/button_rounded_view.dart';
import 'package:elokyetu/ui/container_with_corner.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:elokyetu/util/size/size.dart';
import 'package:elokyetu/widget/post_arte/post_arte.dart';
import 'package:flutter/material.dart';

class ArquiteturaScreen extends StatefulWidget {
  const ArquiteturaScreen({Key? key}) : super(key: key);

  @override
  State<ArquiteturaScreen> createState() => _ArquiteturaScreenState();
}

class _ArquiteturaScreenState extends State<ArquiteturaScreen> {
  final scrollController = ScrollController();
  List<String> text = [
    "Desenho de Mobiliário",
    "Planejamento Urbano",
    "Projeto de Iluminação",
    "Tecnologia da Construção",
  ];
  List<String> image = [
    'assets/imag/mae.jpg',
    'assets/imag/cozinha.png',
    'assets/imag/personal.jpg',
    'assets/imag/personal.jpg',
  ];
  var onTap = [
    CategoriesScreen(),
    CategoriesScreen(),
    PersonalChef(),
    PersonalChef(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: .0,
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        title: TextWithTap("Arquitetura"),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              width: larguraPor(100, context),
              color: Colors.white,
              child: const Text(
                "Representa a sua identidade, \n mostrando os teus hábitos e costumes",
                textAlign: TextAlign.center,
              ),
            ),
            ContainerCorner(
              color: Color.fromARGB(255, 236, 234, 234),
              height: size.width * 0.5,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextWithTap(
                      "Arquitetura",
                      color: Colors.black,
                      marginTop: size.width * 0.02,
                      marginLeft: size.width * 0.04,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: TextWithTap(
                      "Categorias",
                      color: Colors.black,
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
                ],
              ),
            ),
            SizedBox(height: 10),
            ButtonRoundedView(
              title: "Publicar",
              width: size.width,
              colorLetter: Colors.black,
              icon: Transform.rotate(
                angle: -7,
                child: const Icon(Icons.send),
              ),
              action: () {},
            ),
            const SizedBox(height: 10),
            Column(
              children: List.generate(12, (index) => PostArte()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            scrollController.animateTo(0,
                duration: const Duration(seconds: 2), curve: Curves.easeIn);
          });
        },
        backgroundColor: Colors.orange.withOpacity(.7),
        child: const Icon(
          Icons.arrow_upward_rounded,
          color: Colors.white,
        ),
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
            // marginBottom: size.width * 0.11,
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
                    title: TextWithTap(
                      text!,
                      fontSize: 14,
                      overflow: TextOverflow.clip,
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
