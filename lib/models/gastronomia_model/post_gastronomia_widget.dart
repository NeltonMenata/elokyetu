import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:elokyetu/models/gastronomia_model/post_gastronomia_model.dart';
import 'package:elokyetu/screens/categorias/gastronomia/post_categoria_controller.dart';
import 'package:elokyetu/screens/comment/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostGastronomiaWidget extends StatefulWidget {
  PostGastronomiaWidget(this.postGastronomiaModel,
      {this.isBorder = false, Key? key})
      : super(key: key);

  final PostGastronomiaModel postGastronomiaModel;
  final bool isBorder;

  @override
  State<PostGastronomiaWidget> createState() => _PostGastronomiaWidgetState();
}

class _PostGastronomiaWidgetState extends State<PostGastronomiaWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final DateTime? createdAt =
        widget.postGastronomiaModel.createdAt ?? DateTime.now();

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
                                  .postGastronomiaModel.postUserImgPerfil ??
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
                            widget.postGastronomiaModel.postUserName ?? "Autor",
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
            child: Text(widget.postGastronomiaModel.content ?? ""),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: widget.postGastronomiaModel.typeFile == 1
                ? const SizedBox()
                : ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: Get.height * 0.6),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CachedNetworkImage(
                        imageUrl:
                            widget.postGastronomiaModel.filePost?[0] ?? "",
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
                            future: PostController.postController.postGastr
                                .myLike(
                                    LoginController.userInformation!.objectId!,
                                    widget.postGastronomiaModel.objectId!),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return IconButton(
                                    onPressed: () {
                                      setState(() async {
                                        PostController.postController.postGastr
                                            .addLikes(
                                                LoginController
                                                    .userInformation!.objectId!,
                                                widget.postGastronomiaModel
                                                    .objectId!);
                                      });
                                    },
                                    icon: const Icon(Icons.favorite_border,
                                        size: 22, color: Colors.black));
                              } else if (snapshot.hasData) {
                                return IconButton(
                                    onPressed: () async {
                                      PostController.postController.postGastr
                                          .addLikes(
                                              LoginController
                                                  .userInformation!.objectId!,
                                              widget.postGastronomiaModel
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
                                      PostController.postController.postGastr
                                          .addLikes(
                                              LoginController
                                                  .userInformation!.objectId!,
                                              widget.postGastronomiaModel
                                                  .objectId!);
                                      setState(() {});
                                    },
                                    icon: const Icon(Icons.favorite,
                                        size: 22, color: Colors.black));
                              }
                            }),
                        const SizedBox(
                          width: 10,
                        ),
                        FutureBuilder<int>(
                            future: PostController.postController.postGastr
                                .getLikes(
                                    widget.postGastronomiaModel.objectId!),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text("0");
                              } else if (snapshot.hasData) {
                                widget.postGastronomiaModel.likes =
                                    snapshot.data;
                                return Text(
                                  widget.postGastronomiaModel.likes.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return const Text("...");
                              }
                            })
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => CommentPage(PostGastronomiaWidget(
                            widget.postGastronomiaModel)));
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
                              future: PostController.postController.postGastr
                                  .getCountComment(
                                      widget.postGastronomiaModel.objectId!),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
