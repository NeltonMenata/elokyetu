import 'dart:convert';

import '../model_back4app_base.dart';

class PersonalModel extends ModelBack4app {
  final DateTime? born;
  final String? hobby;
  final String? user;
  final String? name;
  final String? profession;
  final String? imgPerfil;

  PersonalModel(
      {this.born,
      this.hobby,
      this.user,
      this.name,
      this.profession,
      this.imgPerfil,
      String? objectId,
      DateTime? createdAt,
      DateTime? updateAt})
      : super(objectId: objectId, createdAt: createdAt, updateAt: updateAt);

  factory PersonalModel.fromJson(Map<String, dynamic> json) {
    return PersonalModel(
      born: json["born"],
      hobby: json["hobby"],
      user: json["user"],
      name: json["name"],
      profession: json["profession"],
      objectId: json["objectId"],
      createdAt: json["createdAt"],
      updateAt: json["updateAt"],
      imgPerfil: json["imgPerfil"],
    );
  }
  var n = PersonalModel();

  String toJson() {
    Map<String, dynamic> data = {
      "born": this.born,
      "hobby": this.hobby,
      "user": this.user,
      "name": this.name,
      "profession": this.profession,
      "objectId": this.objectId,
      "createdAt": this.createdAt,
      "updateAt": this.updateAt,
      "imgPerfil": this.imgPerfil,
    };
    return jsonEncode(data);
  }
}
