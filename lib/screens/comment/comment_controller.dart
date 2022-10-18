import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CommentController extends GetxController {
  static final commentController = Get.put(CommentController());

  Future<List<CommentModel>> getComments(String objectId) async {
    final query = QueryBuilder(ParseObject("Comment"));
    query
      ..includeObject(["user"])
      ..whereEqualTo("post", ParseObject("Post")..objectId = objectId);
    final response = await query.find();
    final serielize = response
        .map(
          (e) => CommentModel(
            comment: e["comment"],
            name: e["user"]["nome"],
            objectId: e.objectId,
          ),
        )
        .toList();
    return serielize;
  }
}

class CommentModel {
  final String? comment;
  final String? name;
  final String? objectId;

  CommentModel({this.comment, this.name, this.objectId});
  factory CommentModel.fromJson(Map<String, dynamic> map) {
    return CommentModel(
      comment: map["comment"],
      name: map["name"],
      objectId: map["objectId"],
    );
  }
}
