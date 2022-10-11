// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/screens/categorias/gastronomia/categoria_gastronomia.dart';
import 'package:elokyetu/screens/categorias/gastronomia/categories_screen.dart';
import 'package:elokyetu/util/size/size.dart';

class Pesquisar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: larguraPor(45, context),
            height: larguraPor(40, context),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30.0,
                ),
                label: Text(' '),
              ),
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
                      child: Image.network(
                        "https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t39.30808-6/208881283_111592097854673_56747460197513187_n.png?_nc_cat=101&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeGOSUgJprR__NFwxmT-efykxUcUeDPB07bFRxR4M8HTtjLLhTFLZ_z72JHZB7s0ZFCGkBswYOPT05LasGit9zEG&_nc_ohc=-e0fiKkT-AcAX-kwBg0&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_zt=23&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=45fb1ddf4d76f162467de08420818de9&oe=61AD0E93",
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
                        Get.to(CategoriasGastronomia());
                      },
                      child: Image.network(
                        "https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t1.18169-9/fr/cp0/e15/q65/22282127_1483037621772590_5393669331675106506_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeG1kB0ucGH7_KMKO8p8SroR8tbgoIGdXg_y1uCggZ1eD6nEji6zeUTXasMimmtSnXMDutqUAXniXIPXE2gGvvg8&_nc_ohc=1IXCSs9dqnoAX9Ftkvl&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=26880aee296e76d0394e7a55bd65dd85&oe=61CE9885",
                        fit: BoxFit.fill,
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
                      child: Image.network(
                        "https://z-m-scontent.flad5-1.fna.fbcdn.net/v/t1.18169-9/fr/cp0/e15/q65/404193_256529631082787_445766537_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=85a577&efg=eyJpIjoibyJ9&_nc_eui2=AeFTNtTDjs9__EFWaHSr2KUjxbIHFpAvNWXFsgcWkC81ZUuv-K828nz_v5E-y1nAneg-Y2ONatEXRBf3ZsB7ARjD&_nc_ohc=NdRwBihWDuQAX-tqlHA&_nc_ad=z-m&_nc_cid=1390&_nc_eh=3cd402253552d1ffc26e2f2ac08dc152&_nc_rml=0&_nc_ht=z-m-scontent.flad5-1.fna&oh=a9ec27485f78451b4881cf4ffe45c26d&oe=61CB78F0",
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
