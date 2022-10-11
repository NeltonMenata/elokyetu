import 'package:flutter/cupertino.dart';

class Produto with ChangeNotifier {
  final String id;
  final String description;
  final String title;
  final String imageUrl;
  bool isFavorite;

  Produto({
    required this.id,
    required this.description,
    required this.title,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners(); //¹ notificar quando uma é marcado como favoritos
  }
}
