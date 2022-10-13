import 'package:elokyetu/screens/postagem/postagem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildFAB extends StatefulWidget {
  const BuildFAB({Key? key}) : super(key: key);

  @override
  State<BuildFAB> createState() => _BuildFABState();
}

class _BuildFABState extends State<BuildFAB> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.to(PostPage());
      },
      backgroundColor: Colors.white,
      child: Icon(
        Icons.add,
        size: 30,
        color: Colors.black,
      ),
    );
  }
}
