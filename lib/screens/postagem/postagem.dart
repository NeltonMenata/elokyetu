// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elokyetu/screens/salas/gastronomia/post_gastronomy_controller.dart';
import 'post_controller.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final _controller = Get.put(PostController());
  String valueText = "Gastronomia";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        _controller.disposeVideo();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          foregroundColor: Colors.black,
          elevation: .0,
          centerTitle: true,
          title: const Text(
            'Publicar',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20.0),

              TextFormField(
                controller: _controller.content,
                // textInputAction: TextInputAction.newline,
                style: const TextStyle(color: Colors.yellow),
                cursorColor: Colors.yellow,
                maxLines: 5,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe qual é o Descrição';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  labelText: 'Publicar ao Elokyetu',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
              /*
              DropdownButton<String>(
                  style: const TextStyle(color: Colors.blueAccent),
                  value: valueText,
                  items: [
                    DropdownMenuItem<String>(
                      value: "gastronomia",
                      child: const Text("Gastronomia"),
                      onTap: () {
                        Get.showSnackbar(const GetSnackBar(
                          message: "Gastronomia",
                          duration: Duration(seconds: 2),
                        ));
                      },
                    ),
                    const DropdownMenuItem<String>(
                      value: "saude",
                      child: Text("Saúde"),
                    ),
                    const DropdownMenuItem<String>(
                      value: "vida_e_estilo",
                      child: Text("Vida e Estilo"),
                    ),
                  ],
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      valueText = value ?? "gastronomia";
                    });
                  }),
                  */

              textOpcoes(
                text: "Carregar Fotos",
                icon: Icons.camera_alt_outlined,
                onTap: () => _controller.selectFilePost(),
              ),
              textOpcoes(
                text: "Carregar Video",
                icon: Icons.video_call_outlined,
                onTap: () => _controller.selectFilePost(),
              ),
              textOpcoes(
                text: "Adicionar Localização",
                icon: Icons.location_on_outlined,
                onTap: () => _controller.selectFilePost(),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: size.width * 0.04,
                ),
              ),
              const SizedBox(height: 20.0),

              SizedBox(
                height: 50.0,
                width: double.infinity,
                // ignore: deprecated_member_use
                child: MaterialButton(
                  onPressed: () {
                    _controller.addPost();
                  },
                  color: Colors.yellow,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: size.width * 0.05,
                          ),
                          child: Text(
                            'Publicar ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: size.width * 0.07,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: -0.6,
                          child: Icon(
                            Icons.send,
                            size: size.width * 0.07,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20.0),
              // _isLoading
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Center(
                  child: GetBuilder<PostGastronomyController>(builder: (_) {
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
      ),
    );
  }

  Widget textOpcoes({
    required String text,
    required Function onTap,
    required IconData icon,
  }) {
    return Container(
      //color: Colors.white,

      padding: const EdgeInsets.only(top: 5),
      width: Get.width * 0.8,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  maxLines: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
