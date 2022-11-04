import 'package:elokyetu/screens/categorias/gastronomia/categoria_gastronomia.dart';
import 'package:elokyetu/ui/container_with_corner.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  int selectedIndex = 0;

  final images = [
    "assets/imag/gastro.jpg",
    "assets/imag/segura.jpg",
    "assets/imag/gastronimia.jpg",
    "assets/img/saude.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const TextWithTap(
          'Panificação',
          fontWeight: FontWeight.bold,
        ),
        elevation: .0,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.12,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ContainerCorner(
                              height: size.width * 0.10,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, _) => const SizedBox(width: 12),
                    itemCount: 4,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PostWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
