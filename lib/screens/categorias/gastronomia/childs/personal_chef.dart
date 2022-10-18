// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/components/main_drawer.dart';
import 'package:elokyetu/data/abel/user_json.dart';
import 'package:elokyetu/data/abel/usuario_list.dart';
import 'package:elokyetu/util/size/size.dart';
import 'package:elokyetu/widget/usuarios_itens/usuarios_itens.dart';

class PersonalChef extends StatelessWidget {
  const PersonalChef({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Usuario usuarios =
    //     ModalRoute.of(context)!.settings.arguments as Usuario;
    final List carregarUsuario = DUMMY_USUARIOS;
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Chef'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: carregarUsuario.length,
        itemBuilder: (ctx, i) => UsuarioItem(carregarUsuario[i]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}

class Segunda extends StatelessWidget {
  const Segunda({
    Key? key,
  }) : super(key: key);

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
                  // Get.to();
                },
                child: Image.asset(
                  'assets/imag/arte.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.yellow,
                title: Text(
                  "Arte",
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
                onTap: () {},
                child: Image.asset(
                  'assetsimag/estilo.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.red,
                title: Text(
                  "Vida e Estilo",
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

class Primeira extends StatelessWidget {
  const Primeira({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: larguraPor(47, context),
          height: larguraPor(49, context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  // Get.to(DetalhePersonal());
                },
                child: Image.asset(
                  'assetsimag/Delcio.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.blue,
                title: Text(
                  "Delcio jengue",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Times New Roman',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: larguraPor(47, context),
          height: larguraPor(49, context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  // Get.to(ProductDetailTela());
                },
                child: Image.asset(
                  //   'assetsimag/logo1.jpg',
                  'assetsimag/abel.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.green,
                title: Text(
                  "Abel Cassinda",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Times New Roman',
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
