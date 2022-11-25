import 'package:elokyetu/screens/comment/comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/response_comment/response_comment_page.dart';
import '../../ui/text_with_tap.dart';

class CommentWidget extends StatefulWidget {
  CommentWidget({Key? key, this.commentModel}) : super(key: key);
  final CommentModel? commentModel;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    var size = Get.size;
    return Card(
      color: Colors.white.withOpacity(.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWithTap(
                    widget.commentModel?.name ?? "Autor",
                    marginTop: size.width * 0.03,
                    marginLeft: size.width * 0.19,
                    alignment: Alignment.topLeft,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWithTap(
                    "${widget.commentModel?.createdAt?.hour}:${widget.commentModel?.createdAt?.minute} pm",
                    marginLeft: size.width * 0.19,
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton(itemBuilder: (_) {
                  return [];
                }),
              ),
            ],
          ),
          TextWithTap(
            widget.commentModel?.comment ?? "Meu Comentário",
            marginTop: size.width * 0.03,
            marginLeft: size.width * 0.08,
            alignment: Alignment.topLeft,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  Get.to(() => ResponseCommentPage());
                }, //showModalButtonText,
                icon: Icon(Icons.star_border),
                label: Text("Responder"),
              ),
              Row(
                children: [
                  Icon(Icons.star_border),
                  TextWithTap(
                    "338",
                    marginRight: size.width * 0.08,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
