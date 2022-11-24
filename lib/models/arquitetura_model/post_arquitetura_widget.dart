import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/models/arquitetura_model/post_arquitetura_model.dart';
import 'package:elokyetu/screens/salas/gastronomia/post_gastronomy_controller.dart';
import 'package:elokyetu/screens/comment/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostArquiteturaWidget extends StatefulWidget {
  PostArquiteturaWidget(this.postArquiteturaModel,
      {this.isBorder = false, Key? key})
      : super(key: key);

  final PostArquiteturaModel postArquiteturaModel;
  final bool isBorder;

  @override
  State<PostArquiteturaWidget> createState() => _PostArquiteturaWidgetState();
}

class _PostArquiteturaWidgetState extends State<PostArquiteturaWidget> {
  @override
  Widget build(BuildContext context) {
    final DateTime? createdAt =
        widget.postArquiteturaModel.createdAt ?? DateTime.now();

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 0,
      ),
      margin: const EdgeInsets.only(
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        border: widget.isBorder
            ? const Border(
                top: BorderSide(color: Colors.black54, width: 0.50),
                bottom: BorderSide(
                  color: Colors.black54,
                  width: 0.50,
                ),
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      //color: Colors.black45,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: widget
                                  .postArquiteturaModel.postUserImgPerfil ??
                              "https://parsefiles.back4app.com/wUKWGiHfn6MybLQtUnrjdg15UhzvLJG7SEx96aK2/dfb57e4b29490f9873ffd802814e7a45_image_picker4481099009907771832.png",
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.postArquiteturaModel.postUserName ?? "Autor",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${createdAt?.hour ?? 1 + 1} : ${createdAt?.minute} |  "
                            "${createdAt?.day}/${createdAt?.month}/${createdAt?.year}",
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.postArquiteturaModel.content ?? ""),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: widget.postArquiteturaModel.typeFile == 1
                ? const SizedBox()
                : ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: Get.height * 0.6),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CachedNetworkImage(
                        imageUrl:
                            widget.postArquiteturaModel.filePost?[0] ?? "",
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        FutureBuilder<bool>(
                            future: PostGastronomyController
                                .postController.postGastr
                                .myLike(
                                    LoginController.userInformation!.objectId!,
                                    widget.postArquiteturaModel.objectId!),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return IconButton(
                                    onPressed: () {
                                      setState(
                                        () async {
                                          PostGastronomyController
                                              .postController.postGastr
                                              .addLikes(
                                                  LoginController
                                                      .userInformation!
                                                      .objectId!,
                                                  widget.postArquiteturaModel
                                                      .objectId!);
                                        },
                                      );
                                    },
                                    icon: const Icon(Icons.favorite_border,
                                        size: 22, color: Colors.black));
                              } else if (snapshot.hasData) {
                                return IconButton(
                                    onPressed: () async {
                                      PostGastronomyController
                                          .postController.postGastr
                                          .addLikes(
                                              LoginController
                                                  .userInformation!.objectId!,
                                              widget.postArquiteturaModel
                                                  .objectId!);
                                      setState(() {});
                                    },
                                    icon: snapshot.data!
                                        ? const Icon(Icons.favorite_border,
                                            size: 22, color: Colors.red)
                                        : const Icon(
                                            Icons.favorite_border,
                                            size: 22,
                                          ));
                              } else {
                                return IconButton(
                                  onPressed: () async {
                                    PostGastronomyController
                                        .postController.postGastr
                                        .addLikes(
                                            LoginController
                                                .userInformation!.objectId!,
                                            widget.postArquiteturaModel
                                                .objectId!);
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.favorite,
                                      size: 22, color: Colors.black),
                                );
                              }
                            }),
                        const SizedBox(
                          width: 10,
                        ),
                        FutureBuilder<int>(
                          future: PostGastronomyController
                              .postController.postGastr
                              .getLikes(widget.postArquiteturaModel.objectId!),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text("0");
                            } else if (snapshot.hasData) {
                              widget.postArquiteturaModel.likes = snapshot.data;
                              return Text(
                                widget.postArquiteturaModel.likes.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              );
                            } else {
                              return const Text("...");
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          () => CommentPage(
                            PostArquiteturaWidget(widget.postArquiteturaModel),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.messenger_outline,
                            size: 22,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          FutureBuilder(
                              future: PostGastronomyController
                                  .postController.postGastr
                                  .getCountComment(
                                      widget.postArquiteturaModel.objectId!),
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot.data.toString() == "null"
                                      ? "..."
                                      : snapshot.data.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: -0.6,
                  child: const Icon(
                    Icons.send,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
