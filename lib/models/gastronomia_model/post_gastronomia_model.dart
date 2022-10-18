import 'package:elokyetu/Back4app/model/post/i_post_model.dart';

class PostGastronomiaModel extends IPostModel {
  final String? postUserImgPerfil;
  final String? postUserName;

  PostGastronomiaModel(
      {String? objectId,
      this.postUserImgPerfil,
      this.postUserName,
      DateTime? createdAt,
      int? typeFile,
      int? likes,
      String? content,
      List<String>? filePost})
      : super(
            objectId: objectId,
            createdAt: createdAt,
            likes: likes,
            typeFile: typeFile,
            content: content,
            filePost: filePost);

  factory PostGastronomiaModel.fromJson(Map<String, dynamic> map) {
    final imgPerfil = map["user"]["imgPerfil"]["url"];

    return PostGastronomiaModel(
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
