import 'package:elokyetu/models/gastronomia_model/post_gastronomia_model.dart';
import 'package:elokyetu/screens/comment/comment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostGastronomiaWidget extends StatelessWidget {
  PostGastronomiaWidget(this.postGastronomiaModel, {Key? key})
      : super(key: key);
  final PostGastronomiaModel postGastronomiaModel;
  @override
  Widget build(BuildContext context) {
    int _likes = postGastronomiaModel.likes ?? 0;
    final DateTime? createdAt =
        postGastronomiaModel.createdAt ?? DateTime.now();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
      margin: const EdgeInsets.only(bottom: 10.0, top: 8),
      decoration: const BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(50),
          border: Border(
              top: BorderSide(color: Colors.black54, width: 0.50),
              bottom: BorderSide(color: Colors.black54, width: 0.50))),
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
                          imageUrl: postGastronomiaModel.postUserImgPerfil ??
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
                            postGastronomiaModel.postUserName ?? "Autor",
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
            child: Text(postGastronomiaModel.content ?? ""),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: postGastronomiaModel.typeFile == 1
                ? const SizedBox()
                : ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: Get.height * 0.6),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: CachedNetworkImage(
                        imageUrl: postGastronomiaModel.filePost?[0] ?? "",
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
                        const Icon(Icons.favorite, size: 22, color: Colors.red),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          postGastronomiaModel.likes.toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => CommentPage(this));
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.messenger_outline,
                            size: 22,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Comment",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          )
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
