import 'package:elokyetu/Back4app/model/post/i_post_model.dart';

class PostArquiteturaModel extends IPostModel {
  final String? postUserImgPerfil;
  final String? postUserName;
  bool isLike;
  PostArquiteturaModel(
      {String? objectId,
      this.postUserImgPerfil =
          "https://parsefiles.back4app.com/wUKWGiHfn6MybLQtUnrjdg15UhzvLJG7SEx96aK2/dfb57e4b29490f9873ffd802814e7a45_image_picker4481099009907771832.png",
      this.postUserName,
      DateTime? createdAt,
      int? typeFile,
      int? likes,
      this.isLike = false,
      String? content,
      List<String>? filePost})
      : super(
            objectId: objectId,
            createdAt: createdAt,
            likes: likes,
            typeFile: typeFile,
            content: content,
            filePost: filePost);

  factory PostArquiteturaModel.fromJson(Map<String, dynamic> map) {
    final imgPerfil = map["user"]["imgPerfil"]["url"];

    return PostArquiteturaModel(
        postUserImgPerfil: imgPerfil,
        filePost: map["filePost"]["url"],
        postUserName: map["user"]["nome"],
        createdAt: map["createdAt"],
        content: map["content"],
        typeFile: map["typeFile"],
        objectId: map["objectId"],
        likes: 148 //map["likes"],
        );
  }
}
