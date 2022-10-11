import 'package:flutter/cupertino.dart';

class Postagem with ChangeNotifier {
  final String id;
  final String descricao;
  final String partilhar;
  final String comentrio;
  final DateTime data;
  final String identificar;
  bool islike;

  Postagem({
    required this.id,
    required this.descricao,
    required this.partilhar,
    required this.comentrio,
    required this.data,
    required this.identificar,
    this.islike = false,
  });

  void meterGosto() {
    islike = !islike;
    notifyListeners(); //¹ notificar quando   o usuario meter gosto
  }
}
