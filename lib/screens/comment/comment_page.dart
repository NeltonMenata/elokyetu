import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/models/gastronomia_model/post_gastronomia_widget.dart';
import 'package:elokyetu/screens/comment/comment_controller.dart';
import 'package:elokyetu/ui/container_with_corner.dart';
import 'package:elokyetu/ui/text_with_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class CommentPage extends StatefulWidget {
  final controller = CommentController.commentController;
  CommentPage(this.postCurrent, {Key? key}) : super(key: key);
  final dynamic postCurrent;
  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final controller = CommentController.commentController;
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.getComments(
        widget.postCurrent.postGastronomiaModel.objectId ?? "undefined");
    var size = MediaQuery.of(context).size;

    showModalButtonText() {
      return showModalBottomSheet(
        // backgroundColor: Colors.white.withOpacity(0.7),
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: ContainerCorner(
              height: size.height / 3,

              radiusTopLeft: 12.0,
              radiusTopRight: 12.0,
              color: kBingWhite,
              marginBottom: MediaQuery.of(context)
                  .viewInsets
                  .bottom, // subir o bottom shhit
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerCorner(
                      marginLeft: size.width / 20,
                      marginRight: size.width / 20,
                      height: 90,
                      imageDecoration: 'assets/loading.gif',
                      radiusTopLeft: 20,
                      radiusTopRight: 20,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 15),
                        child: TextFormField(
                          maxLines: 3,
                          controller: controller.textControllerComment,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width / 20,
                          ),
                          decoration: InputDecoration(
                            hintText: "Comentar",
                            hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: size.width / 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ContainerCorner(
                      height: 50.0,
                      width: double.infinity,
                      marginTop: size.width * 0.10,
                      child: MaterialButton(
                        onPressed: () {
                          controller.addComment(
                              objectIdUser:
                                  LoginController.userInformation!["objectId"],
                              objectIdPost: widget
                                  .postCurrent.postGastronomiaModel.objectId!);
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
                                  'Comentar',
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
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: .0,
        title: const Text("Comentários"),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: ContainerCorner(
        height: Get.size.height * 0.9,
        color: Colors.white,
        imageDecoration: "assets/img/fundo_login.png".toString(),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(child: widget.postCurrent),
                      GetBuilder<CommentController>(
                        init: controller,
                        builder: (_) => controller.isLoadComment
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.amber,
                                ),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: List.generate(
                                  controller.comments.length,
                                  (index) => Card(
                                    color: Colors.white.withOpacity(.8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: size.width * 0.03,
                                                left: size.width * 0.03,
                                                right: size.width * 0.03,
                                              ),
                                              child: CircleAvatar(
                                                backgroundColor: Colors.black,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                TextWithTap(
                                                  controller.comments[index]
                                                          .name ??
                                                      "Autor",
                                                  marginTop: size.width * 0.03,
                                                  marginLeft: size.width * 0.19,
                                                  alignment: Alignment.topLeft,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                TextWithTap(
                                                  "08:22 pm",
                                                  marginLeft: size.width * 0.19,
                                                  alignment: Alignment.topLeft,
                                                ),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: PopupMenuButton(
                                                  itemBuilder: (_) {
                                                return [];
                                              }),
                                            ),
                                          ],
                                        ),
                                        TextWithTap(
                                          controller.comments[index].comment ??
                                              "Meu Comentário",
                                          marginTop: size.width * 0.03,
                                          marginLeft: size.width * 0.08,
                                          alignment: Alignment.topLeft,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextButton.icon(
                                              onPressed: showModalButtonText,
                                              icon: Icon(Icons.star_border),
                                              label: Text("Responder"),
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.star_border),
                                                TextWithTap(
                                                  "338",
                                                  marginRight:
                                                      size.width * 0.08,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      )

                      /*
                  ...List.generate(
                      20,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    print(widget.postCurrent.postGastronomiaModel
                                            .objectId ??
                                        "undefined");
                                  },
                                  child: Text(
                                    "Meu Comentário: $index",
                                    style: const TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const Divider()
                              ],
                            ),
                          ))*/
                    ]),
              ),
            ),
            Container(
              //height: 70,
              constraints: const BoxConstraints(maxHeight: 120),
              width: Get.size.width,
              padding: const EdgeInsets.only(left: 15, right: 10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(28.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: controller.textControllerComment,
                        maxLines: null,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.yellow.withOpacity(.6),
                    child: IconButton(
                      onPressed: () {
                        controller.addComment(
                            objectIdUser:
                                LoginController.userInformation!["objectId"],
                            objectIdPost: widget
                                .postCurrent.postGastronomiaModel.objectId!);
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
