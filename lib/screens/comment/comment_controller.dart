import 'dart:convert';

import 'package:elokyetu/app/app_controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CommentController extends GetxController {
  @override
  onInit() {
    super.onInit();
  }

  static final commentController = Get.put(CommentController());
  final scrollController = ScrollController();
  final List<CommentModel> _comments = [];
  final textControllerComment = TextEditingController();
  List<CommentModel> get comments => _comments;
  var isLoadComment = false;
  Future<void> getComments(String objectId) async {
    _comments.clear();
    isLoadComment = true;
    update();
    final query = QueryBuilder(ParseObject("Comment"));
    query
      ..includeObject(["user"])
      ..setLimit(10)
      ..orderByAscending("createdAt")
      ..whereEqualTo("post", ParseObject("Post")..objectId = objectId);
    final response = await query.find();
    print(response);
    final serielize = response
        .map(
          (e) => CommentModel(
            comment: e["content"],
            name: e["user"]["nome"],
            objectId: e.objectId,
          ),
        )
        .toList();
    _comments.addAll(serielize);
    isLoadComment = false;
    update();
  }

  Future<void> addComment({
    required String objectIdUser,
    required String objectIdPost,
  }) async {
    Get.snackbar(
      "Comentário",
      "Adicionando o seu comentário",
    );
    /*
    final commentParse = ParseObject("Comment");
    commentParse
      ..set("comment", textControllerComment.text)
      ..set("user", ParseObject("Personal")..objectId = objectIdUser)
      ..set("post", ParseObject("Post")..objectId = objectIdPost);
    */
    try {
      final addComment = ParseCloudFunction("addComment");
      final response = await addComment.executeObjectFunction(parameters: {
        "content": textControllerComment.text,
        "userId": objectIdUser,
        "postId": objectIdPost
      });
      print("ADD COMMENT");
      print(response.success);
      _comments.add(
        CommentModel(
          comment: response.result["content"],
          name: LoginController.userInformation!["nome"],
          objectId: response.result.objectId,
        ),
      );
      textControllerComment.clear();
    } catch (e) {
      print(e);
      Exception(e);
    }

    update();
  }
}

class CommentModel {
  final String? comment;
  final String? name;
  final String? objectId;

  CommentModel({this.comment, this.name, this.objectId});
  factory CommentModel.fromJson(Map<String, dynamic> map) {
    return CommentModel(
      comment: map["content"],
      name: map["name"],
      objectId: map["objectId"],
    );
  }

  String toJson() {
    var data = {"name": name, "objectId": objectId, "content": comment};
    return jsonEncode(data);
  }
}
