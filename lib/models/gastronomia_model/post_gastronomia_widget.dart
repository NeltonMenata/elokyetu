import 'package:elokyetu/models/gastronomia_model/post_gastronomia_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostGastronomiaWidget extends StatelessWidget {
  PostGastronomiaWidget(this.postGastronomiaModel, {Key? key})
      : super(key: key);
  final PostGastronomiaModel postGastronomiaModel;
  @override
  Widget build(BuildContext context) {
    int _likes = postGastronomiaModel.likes ?? 0;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
      margin: EdgeInsets.only(bottom: 10.0, top: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(50),
          border: Border(
              top: BorderSide(color: Colors.black54, width: 0.50),
              bottom: BorderSide(color: Colors.black54, width: 0.50))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          postGastronomiaModel.postUserImgPerfil ?? ""),
                      // NetworkImage(postList[index].profile),
                      radius: 26,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postGastronomiaModel.postUserName ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${postGastronomiaModel.created?.hour ?? 1 + 1} : ${postGastronomiaModel.created?.minute} |  "
                          "${postGastronomiaModel.created?.day}/${postGastronomiaModel.created?.month}/${postGastronomiaModel.created?.year}",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text(postGastronomiaModel.postContent ?? ""),
          SizedBox(
            height: 10,
          ),
          Center(
            child: postGastronomiaModel.typeFile == 1
                ? const SizedBox()
                : Container(
                    height: Get.height * 0.5,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      /*
                      image: DecorationImage(
                          image: NetworkImage(postGastronomiaModel.postImg![0]
                              ),
                          fit: BoxFit.fitHeight),
                      */
                    ),
                    //child: Image.network(""),
                  ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.favorite, size: 22, color: Colors.red),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        _likes.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Row(
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
                ],
              ),
              Transform.rotate(
                angle: -0.6,
                child: Icon(
                  Icons.send,
                  size: 22,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
