// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/screens/categorias/gastronomia/post_categoria_controller.dart';
import 'package:video_player/video_player.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _controller = Get.put(PostController());
  String valueText = "Gastronomia";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Criar Publicação',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontFamily: "Times new Roman",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Adicione uma foto',
                      style: TextStyle(
                        color: Colors.yellowAccent[700],
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  IconButton(
                    onPressed: () async {
                      _controller.selectFilePost();
                    },
                    icon: Icon(
                      Icons.photo,
                      color: Colors.yellowAccent[700],
                    ),
                  )
                ],
              ),
            ),
            DropdownButton<String>(
                style: const TextStyle(color: Colors.blueAccent),
                value: valueText,
                items: const [
                  DropdownMenuItem<String>(
                    value: "Gastronomia",
                    child: Text("Gastronomia"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Saúde",
                    child: Text("Saúde"),
                  ),
                  DropdownMenuItem<String>(
                    value: "Vida e Estilo",
                    child: Text("Vida e Estilo"),
                  ),
                ],
                onChanged: (value) {
                  print(value);
                  setState(() {
                    valueText = value ?? "";
                  });
                }),
            GetBuilder<PostController>(
              init: PostController(),
              builder: (_) => Center(
                child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    width: 170,
                    height: 170,
                    child: GestureDetector(
                      onTap: () {
                        //_controller.videoController!.play();
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(65.0),
                          child: _controller.typeFile == 3
                              ? AspectRatio(
                                  aspectRatio: _controller
                                      .videoController!.value.aspectRatio,
                                  child:
                                      VideoPlayer(_controller.videoController!))
                              : _controller.filePost != null
                                  ? Image.file(
                                      _controller.filePost!,
                                      fit: BoxFit.cover,
                                    )
                                  : LoginController.perfilImg()),
                    )),
              ),
            ),

            const SizedBox(height: 20.0),

            Container(
              child: TextFormField(
                controller: _controller.title,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.yellow),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o Titulo';
                  }
                  return null;
                },
                cursorColor: Colors.yellow,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  labelText: ' Titulo',
                  labelStyle:
                      TextStyle(color: Colors.yellow[100], fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              child: TextFormField(
                controller: _controller.content,
                // textInputAction: TextInputAction.newline,
                style: const TextStyle(color: Colors.yellow),
                cursorColor: Colors.yellow,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o Descrição';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  labelText: ' Descrição',
                  labelStyle:
                      TextStyle(color: Colors.yellow[100], fontSize: 16.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 50.0,
              width: double.infinity,
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  _controller.addPost();
                },
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                child: const Text(
                  'Publicar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // _isLoading
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Center(
                child: GetBuilder<PostController>(builder: (_) {
                  // ignore: prefer_const_constructors
                  return Visibility(
                    visible: _controller.isPost,
                    child: const LinearProgressIndicator(
                      minHeight: 5.0,
                      backgroundColor: Colors.blue,
                    ),
                  );
                }),
              ),
            )
            //  Container(width: 0.0, height: 0.0)
          ],
        ),
      ),
    );
  }
}
