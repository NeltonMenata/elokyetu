import 'package:elokyetu/Back4app/model/model_back4app_base.dart';

abstract class IPostModel extends ModelBack4app {
  final String? user;
  final int? typeFile;
  final String? content;
  final dynamic filePost;
  int? likes;
  int countComment;
  final String? category;

  IPostModel({
    this.user,
    this.typeFile,
    this.content,
    this.filePost,
    this.likes,
    this.countComment = 0,
    this.category,
    String? objectId,
    DateTime? createdAt,
    DateTime? updateAt,
  }) : super(
          objectId: objectId,
          createdAt: createdAt,
          updateAt: updateAt,
        );
}
