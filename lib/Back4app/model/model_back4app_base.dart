import 'dart:convert';

abstract class ModelBack4app {
  final String? objectId;
  final DateTime? createdAt;
  final DateTime? updateAt;

  ModelBack4app({this.objectId, this.createdAt, this.updateAt});
}
